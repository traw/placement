placement
=========

Placement cell

Setting up Tomcat 7

1. Install tomcat 7 
2. Add following to tomcat-user.xml, In between-tags <tomcat-users></tomtcat-users>
   
   
   <role rolename="admin"/>
   <role rolename="manager"/>
  
   <!-- configuration to deploy from maven 
       NOTE: Do not configure manager-script and manager-gui to sam user -->
      <role rolename="manager-script"/>  
      <user username="admin" password="admin" roles="manager-script"/>
   <!-- END of deployment configuration-->
   
   <!-- USER Configureation for accessing manager-gui -->
    <role rolename="manager-gui"/>
    <user username="tomcat" password="s3cret" roles="manager-gui"/>
    <!--END of USER configuration for accessing manager-gui-->
 3. Restart tomcat
   
     