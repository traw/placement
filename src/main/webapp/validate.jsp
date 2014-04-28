<%@ page import="org.in.placementv2.util.JspString" %>
<%@ page import="org.in.placementv2.util.JsonPropertyString" %>

<script type="text/javascript">

var studSkillMap = new Object();
var compSkillMap = new Object();

function emptySkillMap(map) {
    for (var key in map) {
        delete studSkillMap[key];
    }
}
function validateForm(obj, act) {
    var retObj = {};
    var ret = true;
    var idField = '<%= JspString.ID_FIELD %>';
    var idInput = document.getElementById(idField).value;
    var alertsEle = document.getElementById("alerts");
    alertsEle.empty();

    if (idInput != 'undefined' && idInput != '') {
        if (isNaN(idInput)) {
            document.getElementById("alerts").innerHTML = "Please Enter valid Number!!!";
            ret = false;
        } else {
            retObj[idField] = idInput;
        }
    }

    var nameField = '<%= JspString.NAME_FIELD %>';
    var nameVal = document.getElementById(nameField).value;
    if (act == '<%= JspString.ACTION_ADD %>' && nameVal == '') {
        alertsEle.innerHTML.concat('Student name field cannot be empty');
        nameVal.focus;
        ret = false;
    } else if (act == '<%= JspString.ACTION_SEARCH %>' && nameVal == '') {
        /*Do nothing */
    } else {
        retObj[nameField] = nameVal;
    }

    if (obj == '<%= JspString.OBJ_STUD %>') {
        var emailIdField = '<%= JspString.EMAIL_ID_FIELD %>';
        var emailAddress = document.getElementById(emailIdField).value;
        if (act == '<%= JspString.ACTION_ADD %>' && emailAddress == '') {
            document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Not a valid e-mail address");
            ret = false;
        } else if (act == '<%= JspString.ACTION_SEARCH%>' && emailAddress == '') {
            /*do nothing*/
        } else {
            retObj[emailIdField] = emailAddress;
        }
    }

    var selectIsPlacedField = '<%= JspString.SELECT_IS_PLACED_FIELD %>';
    var isPlacedField = '<%= JspString.IS_PLACED_FIELD %>';
    var isPlacedIsSelected = document.getElementById(selectIsPlacedField);
    if (obj == '<%= JspString.OBJ_STUD %>') {
        if (act == '<%= JspString.ACTION_SEARCH %>' &&
                (isPlacedIsSelected != 'undefined' && isPlacedIsSelected.checked)) {
            var studentIsPlaced = document.getElementById(isPlacedField).value;
            retObj[isPlacedField] = studentIsPlaced;
        } else if (act == '<%= JspString.ACTION_ADD %>') {
            var studentIsPlaced = document.getElementById(isPlacedField).value;
            retObj[isPlacedField] = studentIsPlaced;
        }
    }

    var sscMarksField = '<%= JspString.SSC_MARKS_FIELD %>';
    var sscMarksCondStr = '<%= JspString.SSC_MARKS_CONDITION_FIELD %>';
    var sscMarks = document.getElementById(sscMarksField).value;
    var sscMarksConditionField = document.getElementById(sscMarksCondStr);
    if (sscMarks != '') {
        if (isNaN(sscMarks)) {
            document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Invalid SSC Marks entered");
            ret = false;
        } else {
            retObj[sscMarksField] = sscMarks;
        }
        if (act == '<%= JspString.ACTION_SEARCH %>') {
            if (sscMarksConditionField = 'undefined' || sscMarksConditionField == '') {
                document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Please select SSC Marks Condition");
                ret = false;
            } else {
                retObj[sscMarksCondStr] = sscMarksConditionField.value;
            }
        }
    }

    var hscMarksField = '<%= JspString.HSC_MARKS_FIELD %>';
    var hscMarksCondStr = '<%= JspString.HSC_MARKS_CONDITION_FIELD %>';
    var hscMarks = document.getElementById(hscMarksField).value;
    var hscMarksCondField = document.getElementById(hscMarksCondStr);
    if (hscMarks != '') {
        if (isNaN(hscMarks)) {
            document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Invalid HSC Marks entered");
            ret = false;
        } else {
            retObj[hscMarksField] = hscMarks;
        }
        if (act == '<%= JspString.ACTION_SEARCH %>') {
            if (hscMarksCondField == 'undefined' || hscMarksCondField == '') {
                document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Please select HSC Marks Condition");
                ret = false;
            } else {
                retObj[hscMarksCondStr] = hscMarksCondField;
            }
        }
    }

    var mcaMarksField = '<%= JspString.MCA_MARKS_FIELD %>';
    var mcaMarksCondStr = '<%= JspString.MCA_MARKS_CONDITION_FIELD %>';
    var mcaMarks = document.getElementById(mcaMarksField).value;
    var mcaMarksCondField = document.getElementById(mcaMarksCondStr);
    if (mcaMarks != '') {
        if (isNaN(mcaMarks)) {
            document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Invalid HSC Marks entered");
            ret = false;
        } else {
            retObj[mcaMarksField] = mcaMarks;
        }
        if (act == '<%= JspString.ACTION_SEARCH %>') {
            if (mcaMarksCondField == 'undefined' || mcaMarksCondField == '') {
                document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Please select MCA Marks Condition");
                ret = false;
            } else {
                retObj[mcaMarksCondStr] = mcaMarksCondField.value;
            }
        }
    }

    if (obj == '<%= JspString.OBJ_COMP %>') {
        var descNod = document.getElementById('<%= JspString.COMP_DESCRIPTION %>');
        if (descNod != 'undefined' || descNod != '') {
            retObj['<%= JspString.COMP_DESCRIPTION %>'] = descNod.value;
        }
    }

    var skillsField = '<%= JspString.SKILL_SELECT_FIELD %>';
    var skills = $('#' + skillsField + ' option:selected');
    var skillArray = new Array();
    $(skills).each(function (index, option) {
        skillArray[index] = option.value;
    });

    if (skillArray.length > 0) {
        retObj[skillsField] = JSON.stringify(skillArray);
    }

    if (ret == false) {
        document.getElementById("alerts").setAttribute('class', 'alert alert-danger show');
    }
    retObj['<%= JspString.VALIDATED_FIELD %>'] = ret;
    return retObj;
}

function dummyResponse() {
    var keys = ["Student ID", "Name", "Email", "Placed", "SSC Marks", "HSC Marks", "MCA Marks"];
    var values = [
        ['1' , 'rajdip', 'r@d.s', 'true', '20', '30', '20']
    ];
    var dummyResponse = {};
    dummyResponse['keys'] = keys;
    dummyResponse['students'] = values;
    return dummyResponse;
}

function buildCompanyTable(jsonObject, dispNode) {
    var compDivNod = document.createElement('div');
    compDivNod.setAttribute('name', 'compTableDiv');

    var compTableNod = document.createElement('table');
    compTableNod.setAttribute('class', 'table table-responsive table-hover table-bordered');
    compTableNod.setAttribute('name', 'studentTable');

    var captionEle = document.createElement('caption');

    var h3Ele = document.createElement('h3');
    h3Ele.setAttribute('align', 'center');
    var captionSpanEle = document.createElement('span');
    captionSpanEle.setAttribute('class', 'label label-primary');
    captionSpanEle.innerHTML = 'Companies<br/>';
    h3Ele.appendChild(captionSpanEle);
    captionEle.appendChild(h3Ele);
    compTableNod.appendChild(captionEle);

    var tHead = document.createElement('thead');
    var tHeadRow = document.createElement('tr');

    var compTableCol = jsonObject['<%= JsonPropertyString.PARAM_KEYS %>'];
    var colCounter = compTableCol.length;
    for (var k = 0; k < colCounter; k++) {
        var tHeadTdNod = document.createElement('td');
        tHeadTdNod.setAttribute('class', 'text-center');
        tHeadTdNod.innerHTML = compTableCol[k];
        tHeadRow.appendChild(tHeadTdNod);
    }
    <!-- Adding delete student Column -->
    var delNod = document.createElement('td');
    delNod.innerHTML = 'Delete';
    tHeadRow.appendChild(delNod);

    tHead.appendChild(tHeadRow);
    compTableNod.appendChild(tHead);

    /* Empty CompSkillMap*/
    emptySkillMap(compSkillMap);

    var rowCounter = jsonObject['<%= JsonPropertyString.PARAM_COMP %>'].length;
    for (var row = 0; row < rowCounter; row++) {
        var rowNod = document.createElement('tr');
        var compRow = jsonObject['<%= JsonPropertyString.PARAM_COMP %>'][row];
        rowNod.setAttribute('compid', compRow[0]);
        var column = 0;
        for (column = 0; column < colCounter; column++) {
            var tdNod = document.createElement('td');
            $(tdNod).append(compRow[column]);
            rowNod.appendChild(tdNod);
        }

        compSkillMap[ compRow[0] ] = compRow[column];

        var delTDNod = document.createElement('td');
        $(delTDNod).append('<button type="button" class="btn btn-xs btn-danger" ' +
                'id="delete-stud-btn" data-toggle="modal" data-target="#confirmDelete"data-title="Delete User" ' +
                'data-message="Are you sure you want to delete this Student ?" ' +
                'onclick="getEditFrom(this)">' +
                '<i class="glyphicon glyphicon-warning-sign glyphicon-align-center"></i>' +
                '</button>');
        rowNod.appendChild(delTDNod);
        compTableNod.appendChild(rowNod);
    }
    compDivNod.appendChild(compTableNod);
    dispNode.empty();
    dispNode.appendChild(compDivNod);
    dispNode.setAttribute('class', 'show')

}

function buildStudentTable(jsonObject, dispNode) {
    var studentDivEle = document.createElement('div');
    studentDivEle.setAttribute("name", "studentTableDiv");
//    studentDivEle.setAttribute("class", "table table-responsive");

    var studTableNod = document.createElement('table');
    studTableNod.setAttribute('class', 'table ');
    studTableNod.setAttribute('name', 'studentTable');

    var captionNod = document.createElement('caption');

    var h3Ele = document.createElement('h3');
    h3Ele.setAttribute('align', 'center');
    var captionSpanEle = document.createElement('span');
    captionSpanEle.setAttribute('class', 'label label-primary');
    captionSpanEle.innerHTML = 'Students<br/>';
    h3Ele.appendChild(captionSpanEle);
    captionNod.appendChild(h3Ele);
    studTableNod.appendChild(captionNod);

    var tHeadEle = document.createElement('thead');
    var tHeadTrEle = document.createElement('tr');
    tHeadTrEle.setAttribute('class', 'active');

    /* Empty StudSkillMap*/
    emptySkillMap(studSkillMap);

    var studentKeysArray = jsonObject['<%= JsonPropertyString.PARAM_KEYS %>'];
    var studentColumnCounter = studentKeysArray.length;
    for (var k = 0; k < studentColumnCounter; k++) {
        var tHeadTrTDEle = document.createElement('td');
        tHeadTrTDEle.setAttribute('style', 'text-align: center;');
        $(tHeadTrTDEle).append('<strong style="color: #195f91">'+studentKeysArray[k]+'</strong>');
        tHeadTrEle.appendChild(tHeadTrTDEle);
    }
    <!-- Adding delete student Column -->
    var deleteEle = document.createElement('td');
    deleteEle.innerHTML = $(tHeadTrTDEle).append('<strong style="color: #195f91">Delete</strong>');;
    tHeadTrEle.appendChild(deleteEle);

    tHeadEle.appendChild(tHeadTrEle);
    studTableNod.appendChild(tHeadEle);

    var studentRowCounter = jsonObject['<%= JsonPropertyString.PARAM_STUDENTS %>'].length;
    for (var row = 0; row < studentRowCounter; row++) {
        var tableRowEle = document.createElement('tr');
        var studentRow = jsonObject['<%= JsonPropertyString.PARAM_STUDENTS %>'][row];
        tableRowEle.setAttribute('studid', studentRow[0]);
        var column = 0;
        for (column = 0; column < studentColumnCounter; column++) {
            var rawTDEle = document.createElement('td');
            rawTDEle.innerHTML = studentRow[column];
            rawTDEle.setAttribute('style', 'text-align: center;');
            tableRowEle.appendChild(rawTDEle);
        }

        studSkillMap[ studentRow[0] ] = studentRow[column];

        var rowTDEle = document.createElement('td');
        $(rowTDEle).append('<button type="button" class="btn btn-xs btn-danger" ' +
                'id="delete-stud-btn" data-toggle="modal" data-target="#confirmDelete"data-title="Delete User" ' +
                'data-message="Are you sure you want to delete this Student ?" ' +
                'onclick="getEditFrom(this)">' +
                '<i class="glyphicon glyphicon-warning-sign glyphicon-align-center"></i>' +
                '</button>');
        tableRowEle.appendChild(rowTDEle);
        studTableNod.appendChild(tableRowEle);
    }
    studentDivEle.appendChild(studTableNod);
    dispNode.empty();
    dispNode.appendChild(studentDivEle);
    dispNode.setAttribute('class', 'show');
}

function deleteTableRaw(button) {
    var rawEle = button.parentNode.parentNode;
    var studId = rawEle.childNodes[0].innerText;
    var studentName = rawEle.childNodes[1].innerText;
    var confirm = window.confirm("Do you Want to delete student:\n" +
            "Student ID: " + studId +
            "\nStudent Name: " + studentName);
    if (confirm == 'true') {
        $.get({
            url: deletestud.jsp,
            data: studId,
            success: function (response) {
                alert(response);
            }
        }, 'JSON');
        rawEle.parentNode.removeChild(rawEle);
    }
}

function getEditFrom(button) {
    var selectedRow = button.parentNode.parentNode;
    var rowText = selectedRow.innerText;
    var rowTextArray = rowText.split("\t");
    $.ajax({
        type: 'GET',
        data: {'<%= JsonPropertyString.PARAM_OBJ %>': '<%= JspString.OBJ_STUD %>',
            '<%=JsonPropertyString.PARAM_TARGET%>': '<%= JspString.LEGEND_EDIT_STUD %>'},
        url: '<%= request.getContextPath() %>' + '/formedit.jsp',
        success: function (html) {
            var targetEle = document.getElementById('<%= JspString.TOP_PANEL %>');
            targetEle.empty();
            $(targetEle).append(html);
            var count = 0;
            document.getElementById('<%= JspString.ID_FIELD%>').value = rowTextArray[count];
            document.getElementById('<%= JspString.NAME_FIELD%>').value = rowTextArray[++count];
            document.getElementById('<%= JspString.SSC_MARKS_FIELD%>').value = rowTextArray[++count];
            document.getElementById('<%= JspString.HSC_MARKS_FIELD%>').value = rowTextArray[++count];
            document.getElementById('<%= JspString.MCA_MARKS_FIELD%>').value = rowTextArray[++count];
            document.getElementById('<%= JspString.IS_PLACED_FIELD%>').checked = rowTextArray[++count];
            document.getElementById('<%= JspString.EMAIL_ID_FIELD%>').value = rowTextArray[++count];
            var selectNod = document.getElementById('<%= JspString.SKILL_SELECT_FIELD %>');
            var skills = studSkillMap [ rowTextArray[0] ];
            for (var index in skills) {
                var skillTemp = skills[index];
                var optionNod = document.createElement('option');
                optionNod.value = skillTemp['<%= JspString.ID_FIELD %>'];
                optionNod.text = skillTemp['<%= JspString.NAME_FIELD %>'];
                selectNod.appendChild(optionNod);
            }
            targetEle.setAttribute('class', 'row show');
        }
    });
}


function search(param_obj, param_act) {
    var param = validateForm(param_obj, param_act);
    if (param['validated'] == false) {
        console.log("Form validation failed");
        delete  param;
        return false;
    }
    delete param['<%= JspString.VALIDATED_FIELD %>'];
    var debug = false;
    if (debug) {
        var resultEle = document.getElementById('<%= JspString.BOTTOM_PANEL %>');
        buildStudentTable(dummyResponse(), resultEle);
    } else {
        $.get('SearchStudentsAction.jsp', param, function (resultText) {
            var alertsNod = document.getElementById('<%= JspString.ALERTS %>');
            console.log("validate: 380");
            if (resultText.hasOwnProperty('<%= JsonPropertyString.ERROR %>')) {
                alertsNod.innerHTML = resultText['<%= JsonPropertyString.ERROR %>'];
                console.log("validate: 383" + resultText['<%= JsonPropertyString.ERROR %>']);
                alertsNod.setAttribute('class', 'alert alert-danger show');
                return;
            } else {
                console.log("validate: 383" + resultText['<%= JsonPropertyString.SUCCESS %>']);
                var bottomPanel = document.getElementById('<%= JspString.BOTTOM_PANEL %>');
                buildStudentTable(resultText, bottomPanel);
            }
        }, 'JSON');
    }
}

function saveStudOrComp(obj, act) {
    var param = validateForm(obj, act);
    if (param['<%= JspString.VALIDATED_FIELD %>'] == false) {
        console.log("Form Validation failed")
        delete param;
        return;
    }
    delete param['<%= JspString.VALIDATED_FIELD %>'];
    param['<%= JsonPropertyString.PARAM_OBJ %>'] = obj;
    param['<%= JsonPropertyString.PARAM_ACTION %>'] = act;
    $.get('SaveAction.jsp', param, function (resultText) {
        var alertsNod = document.getElementById('<%= JspString.ALERTS %>');
        if (resultText.hasOwnProperty('<%= JsonPropertyString.SUCCESS %>')) {
            $(alertsNod).append(resultText['<%= JsonPropertyString.SUCCESS %>']);
            alertsNod.setAttribute('class', 'alert alert-success show');
            console.log(resultText['<%= JsonPropertyString.SUCCESS %>']);
        } else if (resultText.hasOwnProperty('<%= JsonPropertyString.ERROR %>')) {
            $(alertsNod).append(resultText['<%= JsonPropertyString.ERROR %>']);
            alertsNod.setAttribute('class', 'alert alert-danger show');
            console.log(resultText['<%= JsonPropertyString.ERROR %>']);
        }
    }, 'JSON');
}

</script>