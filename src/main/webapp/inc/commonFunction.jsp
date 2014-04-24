<%@ page import="org.in.placementv2.util.JspString" %>
<%@ page import="org.in.placementv2.util.JsonPropertyString" %>
<script type="text/javascript">

    $(window).on('load', function () {
        $('.selectpicker').selectpicker();
    });

    function emptyNode (node) {
        while(node.firstChild) {
            node.removeChild(node.firstChild);
        }
    }

    function getOperation(toGetOperation) {
        var toGetOperationEle = document.getElementById(toGetOperation);
        $.ajax({
            type: 'GET',
            data : {'<%= JsonPropertyString.PARAM_OPERATION %>' : toGetOperationEle.id},
            url: '<%= request.getContextPath() %>' +'/'+toGetOperationEle.name+'.jsp',
            success: function (html) {
                var targetEle = document.getElementById('<%= JspString.TOP_PANEL %>');
                emptyNode(targetEle);
                $(targetEle).append(html);
                targetEle.setAttribute('class', 'row show');
            }
        });
        return false;
    }

</script>