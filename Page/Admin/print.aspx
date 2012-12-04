<%@ Page Language="VB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style media="print">
        .hide_print
        {
            display: none;
        }
    </style>
    <script language="JavaScript">
        function GetPrintContent() {
            var PrintDiv = document.getElementById('printContent');
            var ContentDiv = window.opener.document.getElementById('contentStart');
            PrintDiv.innerHTML = ContentDiv.innerHTML;
        }
    </script>
</head>
<body onload="GetPrintContent();" style="margin: 0; padding: 0; text-align: center;">
<br />
    <div id="printContent" style="width: auto; margin: 0 auto; padding: 0; "> 
    </div>
    <br />
    <input type="button" class="hide_print" value="Imprimer la page" id="btnPrint" onclick="printPage();" />
</body>
<script language="javascript">
    function printPage() {
        var sWinHTML = document.getElementById('printContent');
        window.print(sWinHTML);
    }
</script>
</html>
