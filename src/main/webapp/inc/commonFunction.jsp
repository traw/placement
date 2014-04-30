<%@ page import="org.in.placementv2.util.JspString" %>
<%@ page import="org.in.placementv2.util.JsonPropertyString" %>
<script type="text/javascript">

    $(window).on('load', function () {
        $('.selectpicker').selectpicker();
    });

    HTMLElement.prototype.empty = function() {
        var that = this;
        while (that.hasChildNodes()) {
            that.removeChild(that.lastChild);
        }
    };

    function emptyNode(node) {
        while (node.hasChildNodes()) {
            node.removeChild(node.firstChild);
        }
    }

    function getOperation(page, target_obj, target_action) {
        $.ajax({
            type: 'GET',
            data: {'<%= JsonPropertyString.PARAM_OBJ %>': target_obj,
            '<%= JsonPropertyString.PARAM_ACTION %>': target_action },
            url: '<%= request.getContextPath() %>' + '/' + page + '.jsp',
            success: function (html) {
                var targetEle = document.getElementById('<%= JspString.TOP_PANEL %>');
                targetEle.empty();
                var primaryTable = document.getElementById('<%= JspString.PRIMARY_TABLE %>');
                primaryTable.empty();
                var secondaryTable = document.getElementById('<%= JspString.SECONDARY_TABLE %>');
                secondaryTable.empty();
                $(targetEle).append(html);
                targetEle.setAttribute('class', 'row show');
            }
        });

    }
</script>