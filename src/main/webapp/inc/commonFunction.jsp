<script type="text/javascript">
    function getOperation(toGetOperation) {
        var toGetOperationEle = document.getElementById(toGetOperation);
        var toDisplayOperationEle = document.getElementById('scratchpad');
        toDisplayOperationEle.innerHTML = '';
        $.ajax({
            type: 'GET',
            url: toGetOperationEle.name,
            success: function (html) {
                toDisplayOperationEle.innerHTML = html;
                toDisplayOperationEle.setAttribute('class', 'row show');
            }
        });
        return false;
    }
</script>