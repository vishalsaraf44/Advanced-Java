<%@ page  session="true" %>
   <%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
   <%@ page import="java.util.Iterator" %>
   <%@ page import="java.io.File" %>
<%@ page import="java.io.*" %>
   <%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
   <%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.*"%>
   <%@ page contentType="text/html;charset=UTF-8" language="java" %>


<body>
<% 

String regno=session.getAttribute("id").toString();
boolean isMultipart = ServletFileUpload.isMultipartContent(request);
if (!isMultipart)
{
}
else 
{
  File repository = (File) application.getAttribute("javax.servlet.context.tempdir");

  DiskFileItemFactory factory = new DiskFileItemFactory();
  factory.setRepository(repository);

  ServletFileUpload upload = new ServletFileUpload(factory);
  List items = null;
  try
  {
      items = upload.parseRequest(request);
  }
  catch (FileUploadException e) 
  {
     e.printStackTrace();
  }

   Iterator itr = items.iterator();
   while (itr.hasNext()) 
   {
      FileItem item = (FileItem) itr.next();
      {
         try 
         {
            String	itemName = regno +".jpg";
            //long n=item.getSize();
            //System.out.println("Size of File " + n + " " + item.getContentType());
            if(!item.getName().equals(""))
            {
               File savedFile = new File(config.getServletContext().getRealPath("/")+"image\\"+itemName);
               item.write(savedFile);
               response.sendRedirect("PhotoUpdateSuccess.jsp");
            } 
         }
         catch (Exception e) 
         {
            e.printStackTrace();
         } 
      }
   }
}
%>
</body>
</html>
