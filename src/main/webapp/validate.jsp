<%@ page import="org.in.placementv2.util.JspString" %>
<%@ page import="org.in.placementv2.util.JsonPropertyString" %>

<script type="text/javascript">

function validateForm(obj, act) {
    var retObj = {};
    var ret = true;
    var alertsEle = document.getElementById("alerts");
    alertsEle.empty();

    var idStr = '<%= JspString.ID_FIELD %>';
    var idFiels = document.getElementById(idStr);
    if ((act == '<%= JspString.ACTION_EDIT %>' || act == '<%= JspString.ACTION_DEL %>') && idFiels.value == '') {
        alertsEle.innerHTML.concat('Id field is empty or invalid ');
        idFiels.focus;
        ret = false;
    } else if ((act == '<%= JspString.ACTION_SEARCH %>' || act == '<%= JspString.ACTION_ADD %>')
            && idFiels.value == '') {
        /* Ignore as in search name field can be empty, So Do nothing */
    } else {
        retObj[idStr] = idFiels.value;
    }

    var nameStr = '<%= JspString.NAME_FIELD %>';
    var nameField = document.getElementById(nameStr);
    if ((act == '<%= JspString.ACTION_ADD %>' || act == '<%= JspString.ACTION_EDIT %>') && nameField.value == '') {
        alertsEle.innerHTML.concat('Student name field cannot be empty');
        nameField.focus;
        ret = false;
    } else if (act == '<%= JspString.ACTION_SEARCH %>' && nameField.value == '') {
        /* Ignore as in search name field can be empty, So Do nothing */
    } else {
        retObj[nameStr] = nameField.value;
    }

    if (obj == '<%= JspString.OBJ_STUD %>') {
        var emailIdField = '<%= JspString.EMAIL_ID_FIELD %>';
        var emailAddress = document.getElementById(emailIdField).value;
        if ((act == '<%= JspString.ACTION_ADD %>' || act == '<%= JspString.ACTION_EDIT %>') && emailAddress == '') {
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
                (isPlacedIsSelected != null && isPlacedIsSelected.checked)) {
            var studentIsPlaced = document.getElementById(isPlacedField).value;
            retObj[isPlacedField] = studentIsPlaced;
        } else if (act == '<%= JspString.ACTION_ADD %>') {
            var studentIsPlaced = document.getElementById(isPlacedField).value;
            retObj[isPlacedField] = studentIsPlaced;
        }
    }

    var sscMarksField = '<%= JspString.SSC_MARKS_FIELD %>';
    var sscMarksCondStr = '<%= JspString.SSC_MARKS_CONDITION_FIELD %>';
    var sscMarks = document.getElementById(sscMarksField);
    var sscMarksConditionField = document.getElementById(sscMarksCondStr);
    if (sscMarks != null && sscMarks.value != '') {
        if (isNumber(sscMarks.value)) {
            retObj[sscMarksField] = sscMarks.value;
            if (act == '<%= JspString.ACTION_SEARCH %>' && sscMarksConditionField.value != '') {
                retObj[sscMarksCondStr] = sscMarksConditionField.value;
            } else {
                document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Please select SSC Marks Condition");
                ret = false;
            }
        } else {
            document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Invalid SSC Marks entered");
            ret = false;
        }
    }
    if (act == '<%= JspString.ACTION_ADD %>' || act == '<%= JspString.ACTION_EDIT %>') {
        document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Invalid SSC Marks entered");
        ret = false;
    }

    var hscMarksField = '<%= JspString.HSC_MARKS_FIELD %>';
    var hscMarksCondStr = '<%= JspString.HSC_MARKS_CONDITION_FIELD %>';
    var hscMarks = document.getElementById(hscMarksField);
    var hscMarksCondField = document.getElementById(hscMarksCondStr);
    if (hscMarks != null && hscMarks.value != '') {
        if (isNumber(hscMarks.value)) {
            retObj[hscMarksField] = hscMarks.value;
            if (act == '<%= JspString.ACTION_SEARCH %>' && hscMarksCondField.value != '') {
                retObj[hscMarksCondStr] = hscMarks.value;
            } else {
                document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Please select SSC Marks Condition");
                ret = false;
            }
        } else {
            document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Invalid SSC Marks entered");
            ret = false;
        }
    }
    if (act == '<%= JspString.ACTION_ADD %>' || act == '<%= JspString.ACTION_EDIT %>') {
        document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Invalid SSC Marks entered");
        ret = false;
    }

    var mcaMarksField = '<%= JspString.MCA_MARKS_FIELD %>';
    var mcaMarksCondStr = '<%= JspString.MCA_MARKS_CONDITION_FIELD %>';
    var mcaMarks = document.getElementById(mcaMarksField);
    var mcaMarksCondField = document.getElementById(mcaMarksCondStr);
    if (mcaMarks != null && mcaMarks.value != '') {
        if (isNumber(mcaMarks.value)) {
            retObj[mcaMarksField] = mcaMarks.value;
            if (act == '<%= JspString.ACTION_SEARCH %>' && mcaMarksCondField.value != '') {
                retObj[mcaMarksCondStr] = mcaMarksCondField.value;
            } else {
                document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Please select SSC Marks Condition");
                ret = false;
            }
        } else {
            document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Invalid SSC Marks entered");
            ret = false;
        }
    }
    if (act == '<%= JspString.ACTION_ADD %>' || act == '<%= JspString.ACTION_EDIT %>') {
        document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Invalid SSC Marks entered");
        ret = false;
    }

    if (obj == '<%= JspString.OBJ_COMP %>') {

        var descNod = document.getElementById('<%= JspString.DESCRIPTION_FIELD %>');
        if (act == '<%= JspString.ACTION_ADD %>' && descNod.value == '') {
            document.getElementById("alerts").innerHTML.concat("&lt;br/&gt;Please fill Company description");
            ret = false;
        } else if (act == '<%= JspString.ACTION_SEARCH %>') {
            /*Do nothing as Description is not present for searching
             * instead we can use search string to search for name and description */
        } else {
            retObj['<%= JspString.DESCRIPTION_FIELD %>'] = descNod.value;
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

function buildPrimaryTable(dispNode, obj, act, jsonObject) {
    var divNod = document.createElement('div');
    divNod.setAttribute("name", "tableDiv");
    var title = obj == '<%= JspString.OBJ_STUD %>' ? 'Student'
            : (obj == '<%= JspString.OBJ_COMP %>' ? 'Company' : 'Skill');
    var studTableNod = document.createElement('table');
    studTableNod.setAttribute('class', 'table table-bordered');
    studTableNod.setAttribute('name', obj + 'Table');

    var captionNod = document.createElement('caption');

    var h4Ele = document.createElement('h4');
    h4Ele.setAttribute('align', 'center');
    var captionSpanEle = document.createElement('span');
    captionSpanEle.setAttribute('class', 'label label-primary');
    captionSpanEle.innerHTML = title + '<br/>';
    h4Ele.appendChild(captionSpanEle);
    captionNod.appendChild(h4Ele);
    studTableNod.appendChild(captionNod);

    var tHeadEle = document.createElement('thead');
    var tHeadTrNod = document.createElement('tr');

    var descriptionColumnPosition = -1;
    var skillPosition = -1;
    var columnNameArray = jsonObject['<%= JsonPropertyString.PARAM_KEYS %>'];
    var columnCounter = columnNameArray.length;
    for (var k = 0; k < columnCounter; k++) {
        var tHeadTrTDEle = document.createElement('td');
        tHeadTrTDEle.style.textAlign = 'center';
        if (columnNameArray[k] == '<%= JspString.SKILL_SELECT_FIELD %>') {
            skillPosition = k;
            tHeadTrTDEle.style.display = 'none';
        } else if (columnNameArray[k] == '<%= JspString.DESCRIPTION_FIELD%>') {
            descriptionColumnPosition = k;
            tHeadTrTDEle.style.display = 'none';
        }
        $(tHeadTrTDEle).append('<strong style="color: #195f91">' + columnNameArray[k] + '</strong>');
        tHeadTrNod.appendChild(tHeadTrTDEle);
    }
    <!-- Adding Edit Column -->
    var editCol = document.createElement('td');
    $(editCol).append('<strong style="color: #195f91">Edit</strong>');
    tHeadTrNod.appendChild(editCol);

    <!-- Adding Edit Column -->
    var delCol = document.createElement('td');
    $(delCol).append('<strong style="color: #195f91">Delete</strong>');
    tHeadTrNod.appendChild(delCol);

    <!-- Adding Get sub objects Column -->
    var subObjCol = document.createElement('td');
    var subObjTitle;
    var subObj;
    if (obj == '<%= JspString.OBJ_STUD %>' || obj == '<%= JspString.OBJ_SKILL %>') {
        subObjTitle = 'Companies';
        subObj = '<%= JspString.ACTION_GET_COMP %>';
    } else if (obj == '<%= JspString.OBJ_COMP %>') {
        subObjTitle = 'Students';
        subObj = '<%= JspString.ACTION_GET_STUD %>';
    }
    $(subObjCol).append('<strong style="color: #195f91">' + subObjTitle + '</strong>');
    tHeadTrNod.appendChild(subObjCol);

    tHeadEle.appendChild(tHeadTrNod);
    studTableNod.appendChild(tHeadEle);

    var rowCounter = jsonObject['<%= JsonPropertyString.PARAM_OBJ %>'].length;
    for (var i = 0; i < rowCounter; i++) {
        var trNod = document.createElement('tr');
        var row = jsonObject['<%= JsonPropertyString.PARAM_OBJ %>'][i];
        var column = 0;
        for (column = 0; column < columnCounter; column++) {
            var tdNod = document.createElement('td');
            tdNod.style.textAlign = 'center';
            if (column == descriptionColumnPosition) {
                tdNod.style.display = 'none';
                $(tdNod).append(row[column].replace(/\"([^(\")"]+)\":/g, "$1:"));
            } else if (column == skillPosition) {
                tdNod.style.display = 'none';
                $(tdNod).append(JSON.stringify(row[column]));
            } else {
                $(tdNod).append(row[column]);
            }
            trNod.appendChild(tdNod);
        }
        /* Edit Button for record */
        var tdEditNod = document.createElement('td');
        $(tdEditNod).append('<button type="button" class="btn btn-xs btn-danger" ' +
                'id="delete-stud-btn" data-toggle="modal"' +
                'onclick="getEditFrom(this,&quot;' + obj + '&quot;, &quot;<%= JspString.ACTION_EDIT %>&quot;)">' +
                '<i class="glyphicon glyphicon-edit glyphicon-align-center"></i>' +
                '</button>');
        trNod.appendChild(tdEditNod);

        /* Delete Button for record */
        var tdDelNod = document.createElement('td');
        $(tdDelNod).append('<button type="button" class="btn btn-xs btn-danger" ' +
                'id="delete-stud-btn" data-toggle="modal" data-target="#confirmDelete"data-title="Delete User" ' +
                'data-message="Are you sure you want to delete this Student ?" ' +
                'onclick="deleteObject(this,&quot;' + obj + '&quot;, &quot;<%= JspString.ACTION_DEL %>&quot;)">' +
                '<i class="glyphicon glyphicon-edit glyphicon-align-center"></i>' +
                '</button>');
        trNod.appendChild(tdDelNod);

        /* Get Sub object Button for record */
        var getSubNod = document.createElement('td');
        $(getSubNod).append('<button type="button" class="btn btn-xs btn-danger" ' +
                'id="delete-stud-btn" data-toggle="modal" data-target="#confirmDelete"data-title="Delete User" ' +
                'data-message="Are you sure you want to delete this Student ?" ' +
                'onclick="searchSubObject(&quot;' + row[0] + '&quot;,&quot;<%= JspString.SECONDARY_TABLE %>&quot;,&quot;' + obj + '&quot;, &quot;' + subObj + '&quot;)">' +
                'Get' +
                '</button>');
        trNod.appendChild(getSubNod);

        studTableNod.appendChild(trNod);
    }
    divNod.appendChild(studTableNod);
    divNod.appendChild(document.createElement('hr'));
    dispNode.empty();
    dispNode.appendChild(divNod);
    dispNode.setAttribute('class', 'show');
}

function buildSecondaryTable(dispNode, obj, act, jsonObject) {
    var divNod = document.createElement('div');
    divNod.setAttribute("name", "tableDiv");
    var title = obj == '<%= JspString.OBJ_STUD %>' ? 'Student'
            : (obj == '<%= JspString.OBJ_COMP %>' ? 'Company' : 'Skill');
    var studTableNod = document.createElement('table');
    studTableNod.setAttribute('class', 'table ');
    studTableNod.setAttribute('name', obj + 'Table');

    var captionNod = document.createElement('caption');

    var h3Ele = document.createElement('h3');
    h3Ele.setAttribute('align', 'center');
    var captionSpanEle = document.createElement('span');
    captionSpanEle.setAttribute('class', 'label label-primary');
    captionSpanEle.innerHTML = title + '<br/>';
    h3Ele.appendChild(captionSpanEle);
    captionNod.appendChild(h3Ele);
    studTableNod.appendChild(captionNod);

    var tHeadEle = document.createElement('thead');
    var tHeadTrEle = document.createElement('tr');
    tHeadTrEle.setAttribute('class', 'active');

    var descriptionColumnPosition = -1;
    var skillPosition = -1;
    var columnNameArray = jsonObject['<%= JsonPropertyString.PARAM_KEYS %>'];
    var columnCounter = columnNameArray.length;
    for (var k = 0; k < columnCounter; k++) {
        var tHeadTrTDEle = document.createElement('td');
        tHeadTrTDEle.setAttribute('style', 'text-align: center;');
        if (columnNameArray[k] == '<%= JspString.SKILL_SELECT_FIELD %>') {
            skillPosition = k;
            tHeadTrTDEle.style.display = 'none';
        } else if (columnNameArray[k] == '<%= JspString.DESCRIPTION_FIELD%>') {
            descriptionColumnPosition = k;
            tHeadTrTDEle.style.display = 'none';
        }
        $(tHeadTrTDEle).append('<strong style="color: #195f91">' + columnNameArray[k] + '</strong>');
        tHeadTrEle.appendChild(tHeadTrTDEle);
    }

    tHeadEle.appendChild(tHeadTrEle);
    studTableNod.appendChild(tHeadEle);

    var rowCounter = jsonObject['<%= JsonPropertyString.PARAM_OBJ %>'].length;
    for (var i = 0; i < rowCounter; i++) {
        var trNod = document.createElement('tr');
        var row = jsonObject['<%= JsonPropertyString.PARAM_OBJ %>'][i];
        trNod.setAttribute('id', row[0]);
        var column = 0;
        for (column = 0; column < columnCounter; column++) {
            var tdNod = document.createElement('td');
            tdNod.setAttribute('style', 'text-align: center;');
            if (column == descriptionColumnPosition) {
                tdNod.style.display = 'none';
                $(tdNod).append(row[column].replace(/\"([^(\")"]+)\":/g, "$1:"));
            } else if (column == skillPosition) {
                tdNod.style.display = 'none';
                $(tdNod).append(JSON.stringify(row[column]));
            } else {
                $(tdNod).append(row[column]);
            }
            trNod.appendChild(tdNod);
        }
        studTableNod.appendChild(trNod);
    }
    divNod.appendChild(studTableNod);
    divNod.appendChild(document.createElement('hr'));
    dispNode.empty();
    dispNode.appendChild(divNod);
    dispNode.setAttribute('class', 'show');
}

function deleteObject(button, obj, act) {
    var rowEle = button.parentNode.parentNode;
    var studId = rowEle.childNodes[0].innerText;
    var studentName = rowEle.childNodes[1].innerText;
    var param = {};
    param['<%= JspString.ID_FIELD %>'] = studId;
    param['<%= JsonPropertyString.PARAM_OBJ %>'] = obj;
    param['<%= JsonPropertyString.PARAM_ACTION %>'] = act;
    var confirm = window.confirm("Do you Want to delete:\n" +
            "ID: " + studId +
            "\nName: " + studentName);
    if (confirm == true) {
        $.get('SaveAction.jsp', param, function (resultText) {
            var alertsNod = document.getElementById('<%= JspString.ALERTS %>');
            if (resultText.hasOwnProperty('<%= JsonPropertyString.SUCCESS %>')) {
                $(alertsNod).append('Successfully deleted');
                alertsNod.setAttribute('class', 'alert alert-success show');
                console.log(resultText['<%= JsonPropertyString.SUCCESS %>']);
                rowEle.parentNode.removeChild(rowEle);
            } else if (resultText.hasOwnProperty('<%= JsonPropertyString.ERROR %>')) {
                $(alertsNod).append(resultText['<%= JsonPropertyString.ERROR %>']);
                alertsNod.setAttribute('class', 'alert alert-danger show');
                console.log(resultText['<%= JsonPropertyString.ERROR %>']);
            }
        }, 'json');
    }
}

function getEditFrom(button, obj, act) {
    var selectedRow = button.parentNode.parentNode;
    var param = {};
    param['<%= JsonPropertyString.PARAM_OBJ %>'] = obj;
    param['<%= JsonPropertyString.PARAM_ACTION %>'] = act;
    $.get('formedit.jsp', param, function (html) {
        console.log("validation.jsp: 350 ==> got html from formedit.jsp");
        var targetEle = document.getElementById('<%= JspString.TOP_PANEL %>');
        targetEle.empty();
        $(targetEle).append(html);
        var count = 0;
        document.getElementById('<%= JspString.ID_FIELD%>').value = selectedRow.childNodes[count].innerText;
        document.getElementById('<%= JspString.NAME_FIELD%>').value = selectedRow.childNodes[++count].innerText;

        if (obj == '<%= JspString.OBJ_STUD %>') {
            document.getElementById('<%= JspString.EMAIL_ID_FIELD%>').value = selectedRow.childNodes[++count].innerText;
            document.getElementById('<%= JspString.IS_PLACED_FIELD%>').checked = (selectedRow.childNodes[++count].innerText == 'true');
            document.getElementById('<%= JspString.SSC_MARKS_FIELD%>').value = selectedRow.childNodes[++count].innerText;
            document.getElementById('<%= JspString.HSC_MARKS_FIELD%>').value = selectedRow.childNodes[++count].innerText;
            document.getElementById('<%= JspString.MCA_MARKS_FIELD%>').value = selectedRow.childNodes[++count].innerText;
        } else if (obj == '<%= JspString.OBJ_COMP %>') {
            document.getElementById('<%= JspString.SSC_MARKS_FIELD%>').value = selectedRow.childNodes[++count].innerText;
            document.getElementById('<%= JspString.HSC_MARKS_FIELD%>').value = selectedRow.childNodes[++count].innerText;
            document.getElementById('<%= JspString.MCA_MARKS_FIELD%>').value = selectedRow.childNodes[++count].innerText;
            document.getElementById('<%= JspString.DESCRIPTION_FIELD%>').value = selectedRow.childNodes[++count].innerText;
        }

        if (obj == '<%= JspString.OBJ_COMP %>' || obj == '<%= JspString.OBJ_STUD %>') {
            var selectNod = document.getElementById('<%= JspString.SKILL_SELECT_FIELD %>');
            var skills = JSON.parse(selectedRow.childNodes[++count].innerText);
            for (var index in skills) {
                var skillTemp = skills[index];
                var optionNod = document.createElement('option');
                optionNod.value = skillTemp['<%= JspString.ID_FIELD %>'];
                optionNod.text = skillTemp['<%= JspString.NAME_FIELD %>'];
                selectNod.appendChild(optionNod);
            }
        }
        targetEle.setAttribute('class', 'row show');
    }, 'html');
}


function search(tableId, obj, act) {
    var param = validateForm(obj, act);
    if (param['validated'] == false) {
        console.log("Form validation failed");
        delete  param;
        return false;
    }
    delete param['<%= JspString.VALIDATED_FIELD %>'];
    param['<%= JsonPropertyString.PARAM_OBJ %>'] = obj;
    param['<%= JsonPropertyString.PARAM_ACTION %>'] = act;
    $.get('searchAction.jsp', param, function (resultText) {
        var alertsNod = document.getElementById('<%= JspString.ALERTS %>');
        console.log("validate: 380");
        if (resultText.hasOwnProperty('<%= JsonPropertyString.ERROR %>')) {
            alertsNod.innerHTML = resultText['<%= JsonPropertyString.ERROR %>'];
            console.log("validate: 383" + resultText['<%= JsonPropertyString.ERROR %>']);
            alertsNod.setAttribute('class', 'alert alert-danger show');
            return;
        } else {
            console.log("validate: 383" + resultText['<%= JsonPropertyString.SUCCESS %>']);
            var table = document.getElementById(tableId);
            if (tableId == '<%= JspString.PRIMARY_TABLE %>') {
                buildPrimaryTable(table, obj, act, resultText);
            } else if (tableId == '<%= JspString.SECONDARY_TABLE %>') {
                buildSecondaryTable(table, obj, act, resultText);
            }
        }
    }, 'JSON');
}


function searchSubObject(objId, tableId, obj, act) {
    var param = {};
    param['<%= JspString.ID_FIELD %>'] = objId;
    param['<%= JsonPropertyString.PARAM_OBJ %>'] = obj;
    param['<%= JsonPropertyString.PARAM_ACTION %>'] = act;
    $.get('searchAction.jsp', param, function (resultText) {
        var alertsNod = document.getElementById('<%= JspString.ALERTS %>');
        console.log("validate: 380");
        if (resultText.hasOwnProperty('<%= JsonPropertyString.ERROR %>')) {
            alertsNod.innerHTML = resultText['<%= JsonPropertyString.ERROR %>'];
            console.log("validate: 383" + resultText['<%= JsonPropertyString.ERROR %>']);
            alertsNod.setAttribute('class', 'alert alert-danger show');
            return;
        } else {
            console.log("validate: 383" + resultText['<%= JsonPropertyString.SUCCESS %>']);
            var table = document.getElementById(tableId);
            if (tableId == '<%= JspString.PRIMARY_TABLE %>') {
                buildPrimaryTable(table, obj, act, resultText);
            } else if (tableId == '<%= JspString.SECONDARY_TABLE %>') {
                buildSecondaryTable(table, resultText['<%= JsonPropertyString.PARAM_TARGET %>'], act, resultText);
            }
        }
    }, 'JSON');
}

function saveObject(obj, act) {
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
    }, 'json');
}


function isNumber(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
}
</script>