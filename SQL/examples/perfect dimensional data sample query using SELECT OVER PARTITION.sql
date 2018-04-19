SELECT 
    count( * )
FROM 
        (
        SELECT local_transaction_no, country_name, routing_type_name, trip_type_name, booking_method_name, transaction_type_name, travel_type_name,  ROW_NUMBER()
        OVER 
                (
                PARTITION BY  country_name, routing_type_name, trip_type_name, booking_method_name, transaction_type_name, travel_type_name
                ORDER BY  country_name, routing_type_name, trip_type_name, booking_method_name, transaction_type_name, travel_type_name
                ) SampleCount 
        FROM 
                (
                SELECT 
                        local_transaction_no,
                        to_char(ad.effective_date,'YYYYMM') MONTH_KEY,
                        AD.START_DATE,
                        AD.END_DATE,
                        ISSUINGCOUNTRY.country_name,
                        cm.client_master_code,
                        BOOKINGMETHOD.booking_method_name,
                        tranty.transaction_type_name,
                        --FARETYPE.FARE_TYPE_NAME,
                        origin_city.city_name ORIGIN_CITY,
                        origin_station.station_name ORIGIN_STATION,
                        destination_city.city_name DESTINATION_CITY,
                        destination_station.station_name DESTINATION_STATION,
                        traveltype.travel_type_name,
                        routingtype.routing_type_name,
                        odtriptype.trip_type_name,
                        class.class_name,
                        bt.full_name,
                        FARE_AMOUNT,
                        LOWEST_FARE_AMOUNT,
                        REFERENCE_FARE_AMOUNT,
                        COMMISSION_AMOUNT,
                        POS_DISCOUNT_AMOUNT,
                        CO2_EMISSION
                FROM 
                        -- ACCOUNTBLE DOC AND TRAVEL SEGMENT
                        SCH_EDW.ACCOUNTABLE_DOCUMENT AD,
                        SCH_EDW.TRAVEL_SEGMENT TS,
                        SCH_EDW.TS_ACCOUNTABLE_DOC TSAD,
                        
                        --to and from
                        sch_edw.city origin_city,
                        sch_edw.city destination_city,
                        sch_edw.station origin_station,
                        sch_edw.station destination_station,
                        
                        --booking_traveler
                        sch_edw.booking_traveler_acct_document btad,
                        sch_edw.booking_traveler bt,
                        
                        --CLIENT
                        SCH_EDW.CLIENT CL,
                        SCH_EDW.CLIENT_CLIENT_MASTER CCM,
                        SCH_EDW.CLIENT_MASTER CM,
                        
                        --CURRENCY AND CONVERSION
                        SCH_EDW.CURRENCY_RATE_CONVERSION CRC,
                        SCH_EDW.CONVERSION_RATE_TYPE CRT,
                        
                        --ENRICHMENT
                        SCH_EDW.TRANSACTION_TYPE TRANTY,        
                        SCH_EDW.TRIP_TYPE ODTRIPTYPE,
                        SCH_EDW.COUNTRY ISSUINGCOUNTRY,
                        SCH_EDW.BOOKING_METHOD BOOKINGMETHOD,
                        SCH_EDW.CLASS CLASS,
                        SCH_EDW.TRAVEL_TYPE TRAVELTYPE,
                        sch_edw.routing_type ROUTINGTYPE,
                        SCH_EDW.FARE_TYPE FARETYPE
                WHERE 
                        1=1
                        --ACC DOC TO SEGMENT
                        AND AD.ACCOUNTABLE_DOCUMENT_ID = TSAD.ACCOUNTABLE_DOCUMENT_ID
                        AND TSAD.TRAVEL_SEGMENT_ID = TS.TRAVEL_SEGMENT_ID
                        --AND TS.SEGMENT_SEQUENCE IN (1,0) 
                        
                        --booking_traveler
                        and btad.accountable_document_id = ad.accountable_document_id
                        and bt.booking_traveler_id = btad.booking_traveler_id  
                        
                        --segment to origin destination
                        AND TS.ORIGIN_CITY_ID = ORIGIN_CITY.CITY_ID
                        AND TS.DESTINATION_CITY_ID = DESTINATION_CITY.city_id
                        and ts.origin_station_id = origin_station.station_id
                        and ts.destination_station_id = destination_station.station_id     
                
                        -- ACC DOC TO CLIENT
                        AND AD.CLIENT_MASTER_ID = CM.CLIENT_MASTER_ID
                        AND CM.CLIENT_MASTER_ID = CCM.CLIENT_MASTER_ID
                        AND CCM.CLIENT_ID = CL.CLIENT_ID
                        
                        --MATCH UP THE CURRENCIES AND LIMIT TO THE CORRECT MONTH
                        AND TS.BOOKING_CURRENCY_ID = CRC.IN_CURRENCY_ID 
                        AND CRC.CONVERSION_RATE_TYPE_CODE = CRT.CONVERSION_RATE_TYPE_CODE
                        AND TO_CHAR(AD.EFFECTIVE_DATE,'YYYYMM') = TO_CHAR(CRC.START_DATE,'YYYYMM')
                
                        -- ADD STRUCTURAL JOINS FOR ENRICHMENT DATA
                        AND AD.OD_TRIP_TYPE_ID = ODTRIPTYPE.TRIP_TYPE_ID
                        AND AD.ISSUING_COUNTRY_ID = ISSUINGCOUNTRY.COUNTRY_ID
                        AND AD.BOOKING_METHOD_ID = BOOKINGMETHOD.BOOKING_METHOD_ID
                        AND AD.TICKET_CLASS_ID = CLASS.CLASS_ID
                        AND AD.TRAVEL_TYPE_ID = TRAVELTYPE.TRAVEL_TYPE_ID
                        AND AD.TRANSACTION_TYPE_ID = TRANTY.TRANSACTION_TYPE_ID
                        AND AD.ROUTING_TYPE_ID = ROUTINGTYPE.ROUTING_TYPE_ID (+)
                        AND AD.FARE_TYPE_ID = FARETYPE.FARE_TYPE_ID 
                       
                       --FILTERS
                        --AND TRAVELTYPE.TRAVEL_TYPE_CODE IN ('R') 
                        AND CRT.CONVERSION_RATE_TYPE = 'MONTHLY RATE'            
                        AND CRC.OUT_CURRENCY_ID = (SELECT CURRENCY_ID FROM SCH_EDW.CURRENCY C WHERE C.CURRENCY_CODE = 'USD')
                        --and transaction_type_name != 'VOID'
                        --AND AD.EFFECTIVE_DATE >= TO_DATE('2015/11/01','YYYY/MM/DD')     
                        --AND AD.EFFECTIVE_DATE < TO_DATE('2015/12/01','YYYY/MM/DD')       
                        --AND AD.LOAD_CONTROL_ID = 43006 
                        )
        )
WHERE SampleCount <= 1