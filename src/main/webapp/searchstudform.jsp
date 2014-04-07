<div class="container-fluid">
    <div class="row">
        <ul class="nav nav-pills nav-stacked">
            <li>
                <form name="studSearchForm" action="" method="post" class="form-inline">
                    <div class="input-group">
                        <table class="table-bordered">
                            <tr>
                                <span class="input-group-addon">Student ID</span>
                            </tr>
                            <input type="text" class="form-control" name="inputbox" placeholder="Student ID">
                        </table>
                    </div>
                    <div class="control-group">
                        <button type="submit" class="btn" onclick="return validateForm(this.form);"
                                style="width: 159px; ">Search
                        </button>
                        <div class="controls">

                        </div>
                    </div>
                </form>
            </li>
            <li>
                <div id="alerts"></div>
                </div>
            </li>
        </ul>
        <hr>
    </div>
</div>


<%--

<div class="panel panel-primary">
    <table>
        <tr>
            <div class="panel-body">
                <form name="studSearchForm" action="" method="post" class="form-inline">
                    <div class="input-group">
                        <table class="table-bordered">
                            <tr>
                                <span class="input-group-addon">Student ID</span>
                            </tr>
                            <input type="text" class="form-control" name="inputbox" placeholder="Student ID">
                        </table>
                    </div>
                    <div class="control-group">
                        <button type="submit" class="btn" onclick="return validateForm(this.form);"
                                style="width: 159px; ">Search
                        </button>
                        <div class="controls">

                        </div>
                    </div>
                </form>
            </div>
        </tr>
        <tr>
            <div class="alert alert-danger alert-dismissable" id="demo">
                <strong>OMMMMMMM!!!</strong>
            </div>
        </tr>
    </table>
</div>
--%>

<script type="text/javascript">
    function validateForm(form) {
        var studID = form.inputbox.value;
        if (isNaN(studID)) {
            alert('Hi Rajdip: ' + studID + ' !!');
            document.getElementById("alerts").innerHTML = "Please Enter valid Number!!!";
            document.getElementById("alerts").style.visibility = 'visible';
            document.getElementById("alerts").setAttribute('class', 'alert alert-danger alert-dismissable');
            alert("HI: " + document.getElementById("alerts").getAttribute('class'));
            return false;
        } else {

        }
    }
</script>