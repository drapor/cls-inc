<%@ Page Language="VB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script language=JavaScript>
        function GetPrintContent() {
            var PrintDiv = document.getElementById('printContent');
            var ContentDiv = window.opener.document.getElementById('contentStart');
            PrintDiv.innerHTML = ContentDiv.innerHTML;
        }
          </script>
</head>
<body onload="GetPrintContent();" style="margin:0; text-align:center;">
    <div id="printContent" style="width:auto; margin:0 auto;"> </div>
</body>
</html>
