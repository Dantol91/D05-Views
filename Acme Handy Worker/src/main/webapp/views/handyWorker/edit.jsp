<%--
 * edit.jsp
 *
 * Copyright (C) 2018 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script type="text/javascript">

$(document).ready(function() {
	 $("#formID").submit(function(){
	var m = document.getElementById("phone").value;
	var expreg = /^(\+\d{1,3})?\s(\(\d{3}\))?\s?\d{4,100}$/;
	
	if(!expreg.test(m)){
		
		return confirm("Are you sure you want to save this phone?");
	}
});
});

</script>

<form:form action="actor/handyWorker/edit.do" id="formID"
	modelAttribute="handyWorker">

	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="boxes" />
	<form:hidden path="socialProfiles" />
	<form:hidden path="userAccount" />


	<form:label path="name">
		<spring:message code="handyWorker.name" />:
	</form:label>
	<br>
	<form:input path="name" />
	<form:errors cssClass="error" path="name" />
	<br>
	<br>
	
	<form:label path="middleName">
		<spring:message code="handyWorker.middleName" />:
	</form:label>
	<br>
	<form:input path="middleName" />
	<form:errors cssClass="error" path="middleName" />
	<br>
	<br>

	<form:label path="surname">
		<spring:message code="handyWorker.surname" />:
	</form:label>
	<br>
	<form:input path="surname" />
	<form:errors cssClass="error" path="surname" />
	<br>
	<br>

	<form:label path="email">
		<spring:message code="handyWorker.email" />:
	</form:label>
	<br>
	<form:input path="email" />
	<form:errors cssClass="error" path="email" />
	<br>
	<br>

	<form:label path="phone">
		<spring:message code="handyWorker.phone" />:
	</form:label>
	<br>
	<form:input id="phone" path="phone" />
	<form:errors cssClass="error" path="phone" />
	<br>
	<br>


	<form:label path="address">
		<spring:message code="handyWorker.address" />:
	</form:label>
	<br>
	<form:input path="address" />
	<form:errors cssClass="error" path="address" />
	<br>
	<br>
	
	<display:column title="${photoHeader}">
		<img src="${row.photo}"
			alt="<spring:message code="image.notfound"/>" width="75" height="75" />
	</display:column>




	<input type="submit" name="save"
		value="<spring:message code="handyWorker.edit" />" />

	<input type="button" name="cancel"
		value="<spring:message code="handyWorker.cancel" />"
		onclick="javascript: relativeRedir('/');" />
	<br />

</form:form>
<h2>Social Profiles:</h2>

<display:table pagesize="3" class="displaytag" keepStatus="true"
	name="socialProfiles" requestURI="actor/admin/handyWorker/edit.do" id="row">

	<!-- Action links -->


	<!-- Attributes -->
	
	<spring:message code="handyWorker.socialProfile.nick"
		var="nickHeader" />
	<display:column property="nick" title="${nickHeader}" sortable="false" />

	<spring:message code="handyWorker.socialProfile.name"
		var="nameHeader" />
	<display:column property="name"
		title="${nameHeader}" sortable="false" />

	<spring:message code="handyWorker.socialProfile.link"
		var="linkHeader" />
		
	<display:column title="${linkHeader}"> 
	<a href="${row.link}"><jstl:out value="${row.link}" /></a>
	</display:column>
	<security:authorize access="isAuthenticated()">
		<display:column>
			<a href="socialProfile/edit.do?socialProfileId=${row.id}"> <spring:message
					code="handyWorker.socialProfile.edit" />
			</a>
		</display:column>
	</security:authorize>


</display:table>

<!-- Create socialProfile link -->

<security:authorize access="isAuthenticated()">
	<div>
		<a href="socialProfile/create.do"> <spring:message
				code="handyWorker.socialProfile.create" />
		</a>
	</div>
</security:authorize>










