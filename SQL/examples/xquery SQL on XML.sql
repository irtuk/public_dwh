
with vendor_node as (

        select a.MDF_AUDIT_ID, vendornode.*
        from sch_edw_stg.mdf_audit a
        cross join xmltable(
          xmlnamespaces('http://schema.myclient.com/V1' as "v1"
              ,'http://schema.myclient.com/TravelReservation' as "resr"
              ,'http://schema.myclient.com/TravelReservationTransaction' as "trans"
              ,'http://www.w3.org/2001/XMLSchema' as "xsd"
              ,'http://www.w3.org/2001/XMLSchema-instance' as "xsi")
            ,'/trans:TravelReservationRequest/resr:CWTTravelReservation/resr:Reservation/resr:VendorList/resr:Vendor'
          passing a.mdf_xml_text
          columns 
            "VENDORCODE" VARCHAR2(255) PATH '@vendorCode',
            "VENDORCLASSCODE" VARCHAR2(255) PATH '@vendorClassCode',
            "VENDORCLASSIFICATION" VARCHAR2(255) PATH '@vendorClassification',
            "VENDORNAME" VARCHAR2(255) PATH '@vendorName') vendornode
            ),






reservation_node as (
        
        select a.MDF_AUDIT_ID, resnode.* from 
        sch_edw_stg.mdf_audit a
        cross join xmltable(
          xmlnamespaces('http://schema.myclient.com/V1' as "v1"
              ,'http://schema.myclient.com/TravelReservation' as "resr"
              ,'http://schema.myclient.com/TravelReservationTransaction' as "trans"
              ,'http://www.w3.org/2001/XMLSchema' as "xsd"
              ,'http://www.w3.org/2001/XMLSchema-instance' as "xsi")
            ,'/trans:TravelReservationRequest/resr:CWTTravelReservation/resr:Reservation'
          passing a.mdf_xml_text
          columns 
            "LOCATOR" VARCHAR2(255) PATH '@recordLocatorNumber',
            "SUPPLIER" VARCHAR2(255) PATH '@supplierService') resnode
            ),
            
base_node as (

        select a.MDF_AUDIT_ID, basenode.*
        from sch_edw_stg.mdf_audit a
        cross join xmltable(
          xmlnamespaces('http://schema.myclient.com/V1' as "v1"
              ,'http://schema.myclient.com/TravelReservation' as "resr"
              ,'http://schema.myclient.com/TravelReservationTransaction' as "trans"
              ,'http://www.w3.org/2001/XMLSchema' as "xsd"
              ,'http://www.w3.org/2001/XMLSchema-instance' as "xsi")
            ,'trans:TravelReservationRequest'
          passing a.mdf_xml_text
          columns 
            "TRANSACTIONTYPE" VARCHAR2(255) PATH '@transactionType') basenode
            )        

select * from base_node b 
left join reservation_node r on r.mdf_audit_id = b.mdf_audit_id
left join vendor_node v on v.mdf_audit_id = b.mdf_audit_id
