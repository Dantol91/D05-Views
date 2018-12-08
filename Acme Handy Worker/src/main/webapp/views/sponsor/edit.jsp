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


<form:form action="actor/sponsor/edit.do" id="formID"
	modelAttribute="sponsor">

	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="folders" />
	<form:hidden path="socialIdentities" />
	<form:hidden path="userAccount" />


	<form:label path="name">
		<spring:message code="sponsor.name" />:
	</form:label>
	<br>
	
	<form:input path="name" />
	<form:errors cssClass="error" path="name" />
	<br>
	<br>

	<form:label path="middleName">
		<spring:message code="sponsor.middleName" />:
	</form:label>
	<br>
	
	<form:input path="middleName" />
	<form:errors cssClass="error" path="middleName" />
	<br>
	<br>
	
	
	<form:label path="surname">
		<spring:message code="sponsor.surname" />:
	</form:label>
	<br>
	
	
	<form:input path="surname" />
	<form:errors cssClass="error" path="surname" />
	<br>
	<br>

	<form:label path="email">
		<spring:message code="sponsor.email" />:
	</form:label>
	<br>
	<form:input path="email" />
	<form:errors cssClass="error" path="email" />
	<br>
	<br>

	<form:label path="phone">
		<spring:message code="sponsor.phone" />:
	</form:label>
	<br>
	<form:input id="phone" path="phone" />
	<form:errors cssClass="error" path="phone" />
	<br>
	<br>


	<form:label path="address">
		<spring:message code="sponsor.address" />:
	</form:label>
	<br>
	<form:input path="address" />
	<form:errors cssClass="error" path="address" />
	<br>
	<br>

	<spring:message code="sponsor.photo"
		var="photoHeader" />
	<display:column title="${photoHeader}">
		<img src="${row.photoUrl}"
			alt="<spring:message code="image.notfound"/>" width="75" height="75" />
	</display:column>


	<input type="submit" name="save"
		value="<spring:message code="sponsor.edit" />" />

	<input type="button" name="cancel"
		value="<spring:message code="sponsor.cancel" />"
		onclick="javascript: relativeRedir('/');" />
	<br />

</form:form>
<h2>Social Identities:</h2>

<display:table pagesize="3" class="displaytag" keepStatus="true"
	name="socialProfiles" requestURI="actor/admin/sponsor/edit.do" id="row">

	<!-- Action links -->

	<security:authorize access="isAuthenticated()">
		<display:column>
			<a href="socialProfile/edit.do?socialProfileId=${row.id}"> <spring:message
					code="sponsor.socialProfile.editar" />
			</a>
		</display:column>
	</security:authorize>


	<!-- Attributes -->

	<spring:message code="sponsor.socialProfile.nick"
		var="nickHeader" />
	<display:column property="nick" title="${nickHeader}" sortable="false" />

	<spring:message code="sponsor.socialProfile.name"
		var="socialNetworkNameHeader" />
	<display:column property="name"
		title="${nameHeader}" sortable="false" />

	<spring:message code="sponsor.socialProfile.link"
		var="profileLinkHeader" />
	<display:column property="link" title="${linkHeader}"
		sortable="false" />


</display:table>

<!-- Create SocialProfile link -->

<security:authorize access="isAuthenticated()">
	<div>
		<a href="socialProfile/create.do"> <spring:message
				code="sponsor.socialProfile.create" />
		</a>
	</div>
</security:authorize>
