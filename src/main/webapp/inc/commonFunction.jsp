<script type="text/javascript">
    function getOperation(toGetOperation) {
        var toGetOperationEle = document.getElementById(toGetOperation);
        var toDisplayOperationEle = document.getElementById('operation_id');
        toGetOperationEle.innerHTML = "";
        $.ajax({
            type:'GET',
            url: toGetOperationEle.title,
            success: function (html) {
                toDisplayOperationEle.innerHTML = html;
                toDisplayOperationEle.setAttribute('class', 'row show');
            }
        });
        return false;

    }
    ;
</script>