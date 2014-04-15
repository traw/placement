<fieldset>
    <legend><p class="text-info text-left">Student Search Form</p></legend>
    <form class="form" name="studSearchForm" action="" method="post" role="form"
          onsubmit="return searchStudents(this.form);">
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <input class="form-control" id="student_id" name="studID" size="30" type="text"
                           placeholder="Student ID">
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group">
                    <input class="form-control" id="student_name" name="name" size="30" type="text"
                           placeholder="Student Name">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <input class="form-control" id="student_email_id" name="student[email]" size="30" type="email"
                           placeholder="Student Email ID">
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group input-group">
                	<span class="input-group-addon">
        				<input id="select_is_placed" type="checkbox">
      				</span>
                    <select id="student_is_placed" class="form-control">
                        <option>IsPlaced</option>
                        <option>Not Placed</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <input class="form-control" id="student_ssc_marks" name="student[sscmarks]" size="30" type="text"
                           placeholder="Student SSC Marks">
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group input-group">
                    <span class="input-group-addon">SSC Marks Condition</span>
                    <select id="student_ssc_marks_condition" class="form-control">
                        <option></option>
                        <option>=</option>
                        <option>&lt;=</option>
                        <option>&gt;=</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <input class="form-control" id="student_hsc_marks" name="student[hscmarks]" size="30" type="text"
                           placeholder="Student HSC Marks">
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group input-group">
                    <span class="input-group-addon">
        				<span class="">HSC Marks Condition</span>
      				</span>
                    <select id="student_hsc_marks_condition" class="form-control">
                        <option></option>
                        <option>=</option>
                        <option>&lt;=</option>
                        <option>&gt;=</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4">
                <div class="form-group">
                    <input class="form-control" id="student_mca_marks" name="student[mcamarks]" size="30" type="text"
                           placeholder="Student MCA Marks">
                </div>
            </div>
            <div class="col-sm-4">
                <div class="form-group input-group">
                    <span class="input-group-addon">
        			    <span class="">MCA Marks Condition</span>
      				</span>
                    <select id="student_mca_marks_condition" class="form-control">
                        <option></option>
                        <option>=</option>
                        <option>&lt;=</option>
                        <option>&gt;=</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4">
                <%--<button type="submit" id="btnSearch" class="btn btn-primary" onclick="return searchStudents(this.form);">Search</button>--%>
                <button type="submit" class="btn center-block bg-primary" style="width: 159px; ">
                    <span>Search</span>
                </button>
            </div>
            <div class="col-sm-4">
                <button type="reset" class="btn bg-primary " style="width: 159px; ">
                    <span>Reset</span>
                </button>
            </div>
        </div>
    </form>
</fieldset>
<div id="alerts" class="alert hidden">
    <strong>HI Rajdip!!!</strong>
</div>
<hr>

