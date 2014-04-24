<%@ page import="org.in.placementv2.util.JspString" %>
<%@ page import="org.in.placementv2.util.JsonPropertyString" %>

<script type="text/javascript">
function validateForm(form) {
    var studentSearch = {};
    var ret = true;
    var idField = '<%= JspString.ID_FIELD %>';
    var studID = document.getElementById(idField).value;
    var alertsEle = document.getElementById("alerts");
    alertsEle.innerHTML = "";
    if (studID != 'undefined') {
        if (isNaN(studID)) {
            document.getElementById("alerts").innerHTML = "Please Enter valid Number!!!";
            ret = false;
            console.log(127);
        } else {
            studentSearch[idField] = studID;
        }
    }

    var nameField = '<%= JspString.NAME_FIELD %>';
    var nameValid = document.getElementById(nameField).value;
    if (nameValid == '') {
        alertsEle.innerHTML.concat('Student name field cannot be empty');
        nameValid.focus;
    } else {
        studentSearch[nameField] = nameValid;
    }

    var emailIdField = '<%= JspString.EMAIL_ID_FIELD %>';
    var emailAddress = document.getElementById(emailIdField).value;
    if (emailAddress != 'undefined' && emailAddress != '') {
        var atpos = emailAddress.indexOf("@");
        var dotpos = emailAddress.lastIndexOf(".");
        if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length) {
            document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Not a valid e-mail address");
            ret = false;
            console.log(193);
        } else {
            studentSearch[emailIdField] = emailAddress;
        }
    }

    var selectIsPlacedField = '<%= JspString.SELECT_IS_PLACED_FIELD%>';
    var isPlacedField = '<%= JspString.IS_PLACED_FIELD%>';
    var isPlacedIsSelected = document.getElementById(selectIsPlacedField);
    if (isPlacedIsSelected != 'undefined' && isPlacedIsSelected.checked) {
        var studentIsPlaced = document.getElementById(isPlacedField).value;
        studentSearch[isPlacedField] = studentIsPlaced;
    }

    var sscMarksField = '<%= JspString.SSC_MARKS_FIELD %>';
    var sscMarksConditionField = '<%= JspString.SSC_MARKS_CONDITION_FIELD %>';
    var sscMarks = document.getElementById(sscMarksField).value;
    var sscMarksCondition = document.getElementById(sscMarksConditionField).value;
    if (sscMarks != '') {
        if (isNaN(sscMarks)) {
            document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Invalid SSC Marks entered");
            ret = false;
            console.log(147);
        } else if (sscMarksCondition == '') {
            document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Please select SSC Marks Condition");
        } else {
            studentSearch[sscMarksField] = sscMarks;
            studentSearch[sscMarksConditionField] = sscMarksCondition;
        }
    }

    var hscMarksField = '<%= JspString.HSC_MARKS_FIELD %>';
    var hscMarksConditionField = '<%= JspString.HSC_MARKS_CONDITION_FIELD %>';
    var hscMarks = document.getElementById(hscMarksField).value;
    var hscMarksCondition = document.getElementById(hscMarksConditionField).value;
    if (hscMarks != '') {
        if (isNaN(hscMarks)) {
            document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Invalid HSC Marks entered");
            ret = false;
            console.log(153);
        } else if (hscMarksCondition == '') {
            document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Please select HSC Marks Condition");
        } else {
            studentSearch[hscMarksField] = hscMarks;
            studentSearch[hscMarksConditionField] = hscMarksCondition;
        }
    }

    var mcaMarksField = '<%= JspString.MCA_MARKS_FIELD %>';
    var mcaMarksConditionField = '<%= JspString.MCA_MARKS_CONDITION_FIELD %>';
    var mcaMarks = document.getElementById(mcaMarksField).value;
    var mcaMarksCondition = document.getElementById(mcaMarksConditionField).value;
    if (mcaMarks != '') {
        if (isNaN(mcaMarks)) {
            document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Invalid HSC Marks entered");
            ret = false;
            console.log(158);
        } else if (mcaMarksCondition == '') {
            document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Please select MCA Marks Condition");
        } else {
            studentSearch[mcaMarksField] = mcaMarks;
            studentSearch[mcaMarksConditionField] = mcaMarksCondition;
        }
    }

    var skillsField = '<%= JspString.SKILL_SELECT_FIELD %>';
    var skills = $( '#'+skillsField + ' option:selected');
    var skillArray = new Array();
    $(skills).each(function(index, value) {
        var self = $(this);
        skillArray[index] = self.text();
    });
    studentSearch[skillsField] = skillArray;

    if (ret == false) {
        document.getElementById("alerts").setAttribute('class', 'alert alert-danger show');
    }
    studentSearch['<%= JspString.VALIDATED_FIELD %>'] = ret;
    return studentSearch;
}

function search(form) {
    var stud = validateForm(form);
    if (stud['validated'] == false) {
        console.log("Form validation failed");
        delete  stud;
        return false;
    }
    delete stud['<%= JspString.VALIDATED_FIELD %>'];
    var debug = true;
    if (debug) {
        var resultEle = document.getElementById('<%= JspString.BOTTOM_PANEL %>');
        createAndShowTable(dummyResponse(), resultEle);
    } else {
        $.get('SearchStudentsAction.jsp', stud, function (resultText) {
            if (resultText.hasOwnProperty('error')) {
                document.getElementById("alerts").innerHTML = resultText['error'];
                document.getElementById("alerts").setAttribute('class', 'alert alert-danger show');
                return false;
            }
            var bottomPanel = document.getElementById('<%= JspString.BOTTOM_PANEL %>');
            createAndShowTable(resultText, bottomPanel);
        }, 'JSON');
    }
    return false;
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

function createAndShowTable(jsonObject, dispEle) {
    var studentDivEle = document.createElement('div');
    studentDivEle.setAttribute("name", "studentTableDiv");
    studentDivEle.setAttribute("class", "table table-responsive");

    var studentTableEle = document.createElement('table');
    studentTableEle.setAttribute('class', 'table table-hover table-bordered');
    studentTableEle.setAttribute('name', 'studentTable');
    studentTableEle.setAttribute('text-align', 'center');

    var captionEle = document.createElement('caption');

    var h3Ele = document.createElement('h3');
    h3Ele.setAttribute('align', 'center');
    var captionSpanEle = document.createElement('span');
    captionSpanEle.setAttribute('class', 'label label-primary');
    captionSpanEle.innerHTML = 'Students<br/>';
    h3Ele.appendChild(captionSpanEle);
    captionEle.appendChild(h3Ele);
    studentTableEle.appendChild(captionEle);

    var tHeadEle = document.createElement('thead');
    var tHeadTrEle = document.createElement('tr');
    tHeadTrEle.setAttribute('class', 'success');

    var studentKeysArray = jsonObject.keys;
    var studentColumnCounter = jsonObject.keys.length;
    for (var k = 0; k < studentColumnCounter; k++) {
        var tHeadTrTDEle = document.createElement('td');
        tHeadTrTDEle.setAttribute('class', 'text-center');
        tHeadTrTDEle.innerHTML = studentKeysArray[k];
        tHeadTrEle.appendChild(tHeadTrTDEle);
    }
    <!-- Adding delete student Column -->
    var deleteEle = document.createElement('td');
    deleteEle.innerHTML = 'Delete';
    tHeadTrEle.appendChild(deleteEle);

    tHeadEle.appendChild(tHeadTrEle);
    studentTableEle.appendChild(tHeadEle);

    var studentRowCounter = jsonObject.students.length;
    for (var row = 0; row < studentRowCounter; row++) {
        var tableRowEle = document.createElement('tr');
        var studentRow = jsonObject.students[row];
        tableRowEle.setAttribute('studid', studentRow[0]);
        for (var column = 0; column < studentColumnCounter; column++) {
            var rawTDEle = document.createElement('td');
            rawTDEle.innerHTML = studentRow[column];
            tableRowEle.appendChild(rawTDEle);
        }

        var rowTDEle = document.createElement('td');
        rowTDEle.innerHTML = '<button type="button" class="btn btn-xs btn-danger" ' +
                'id="delete-stud-btn" data-toggle="modal" data-target="#confirmDelete"data-title="Delete User" ' +
                'data-message="Are you sure you want to delete this Student ?" ' +
                'onclick="editStudent(this)">' +
                '<i class="glyphicon glyphicon-warning-sign glyphicon-align-center"></i>' +
                '</button>';
        tableRowEle.appendChild(rowTDEle);
        studentTableEle.appendChild(tableRowEle);
    }
    studentDivEle.appendChild(studentTableEle);
    emptyNode(dispEle);
    dispEle.appendChild(studentDivEle);
    dispEle.setAttribute('class', 'show')
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

function editStudent(button) {
    var selectedRow = button.parentNode.parentNode;
    var rowText = selectedRow.innerText;
    var rowTextarray = rowText.split("\t");


    $.ajax({
        type: 'GET',
        data : {'<%= JsonPropertyString.PARAM_OPERATION %>' : '<%= JspString.OP_ADD_STUD %>'},
        url: '<%= request.getContextPath() %>' +'/editform.jsp',
        success: function (html) {
            var targetEle = document.getElementById('<%= JspString.TOP_PANEL %>');
            emptyNode(targetEle);
            $(targetEle).append(html);
            var formEle = document.forms['<%= JspString.ADD_COMP_STUD_FORM %>'];
            var count = -1;
            var idEle = document.getElementById('<%= JspString.ID_FIELD%>');
            idEle.value = rowTextarray[++count];
            var nameEle = document.getElementById('<%= JspString.NAME_FIELD%>');
            nameEle.value = rowTextarray[++count];
            var sscMarksEle = document.getElementById('<%= JspString.SSC_MARKS_FIELD%>');
            sscMarksEle.value = rowTextarray[++count];
            var hscMarksEle = document.getElementById('<%= JspString.HSC_MARKS_FIELD%>');
            hscMarksEle.value = rowTextarray[++count];
            var mcaMarksEle = document.getElementById('<%= JspString.MCA_MARKS_FIELD%>');
            mcaMarksEle.value = rowTextarray[++count];
            var isPlacedEle = document.getElementById('<%= JspString.IS_PLACED_FIELD%>');
            isPlacedEle.checked = rowTextarray[++count];
            var emailEle = document.getElementById('<%= JspString.EMAIL_ID_FIELD%>');
            emailEle.value = rowTextarray[++count];
            targetEle.setAttribute('class', 'row show');
        }
    });

}

</script>