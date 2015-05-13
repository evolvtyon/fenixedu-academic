<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<spring:url var="datatablesUrl" value="/javaScript/dataTables/media/js/jquery.dataTables.latest.min.js"/>
<spring:url var="datatablesBootstrapJsUrl" value="/javaScript/dataTables/media/js/jquery.dataTables.bootstrap.min.js"></spring:url>
<script type="text/javascript" src="${datatablesUrl}"></script>
<script type="text/javascript" src="${datatablesBootstrapJsUrl}"></script>
<spring:url var="datatablesCssUrl" value="/CSS/dataTables/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="${datatablesCssUrl}"/>
<spring:url var="datatablesI18NUrl" value="/javaScript/dataTables/media/i18n/${portal.locale.language}.json"/>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/CSS/dataTables/dataTables.bootstrap.min.css"/>

${portal.toolkit()}

<%-- TITLE --%>
<div class="page-header">
	<h1><spring:message code="label.StatuteTypeManagement.updateStatuteType" />
		<small></small>
	</h1>
</div>

<%-- NAVIGATION --%>
<div class="well well-sm" style="display:inline-block">
	<a class="" href="${pageContext.request.contextPath}/academic-configurations/statutetypemanagement/statutetype/read/${statuteType.externalId}" ><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span>&nbsp;<spring:message code="label.event.back" /></a></div>
	<c:if test="${not empty infoMessages}">
				<div class="alert alert-info" role="alert">
					
					<c:forEach items="${infoMessages}" var="message"> 
						<p>${message}</p>
					</c:forEach>
					
				</div>	
			</c:if>
			<c:if test="${not empty warningMessages}">
				<div class="alert alert-warning" role="alert">
					
					<c:forEach items="${warningMessages}" var="message"> 
						<p>${message}</p>
					</c:forEach>
					
				</div>	
			</c:if>
			<c:if test="${not empty errorMessages}">
				<div class="alert alert-danger" role="alert">
					
					<c:forEach items="${errorMessages}" var="message"> 
						<p>${message}</p>
					</c:forEach>
					
				</div>	
			</c:if>

<form method="post" class="form-horizontal">
<div class="panel panel-default">
  <div class="panel-body">
<div class="form-group row">
<div class="col-sm-2 control-label"><spring:message code="label.StatuteType.code"/></div> 

<div class="col-sm-10">
	<input id="statuteType_code" class="form-control" type="text" name="code" value="${not empty param.code ? param.code : statuteType.code }" required/> 
</div>
</div>
<div class="form-group row">
<div class="col-sm-2 control-label"><spring:message code="label.StatuteType.name"/></div> 

<div class="col-sm-10">
	<input id="statuteType_name" class="form-control" type="text" name="name"  bennu-localized-string value='${not empty param.name ? param.name.json() : statuteType.name.json() }' required/> 
</div>
</div>		
<div class="form-group row">
<div class="col-sm-2 control-label"><spring:message code="label.StatuteType.active"/></div> 

<div class="col-sm-2">
<select id="statuteType_active" name="active">
<option value="true"><spring:message code="label.yes"/></option>				
<option value="false"><spring:message code="label.no"/></option>
</select>
	<script>
		$("#statuteType_active").val("${not empty param.active ? param.active : statuteType.active }");
	</script>	
</div>
</div>		
<div class="form-group row">
<div class="col-sm-2 control-label"><spring:message code="label.StatuteType.visible"/></div> 

<div class="col-sm-2">
<select id="statuteType_visible" name="visible">
<option value="true"><spring:message code="label.yes"/></option>				
<option value="false"><spring:message code="label.no"/></option>
</select>
	<script>
		$("#statuteType_visible").val("${not empty param.visible ? param.visible : statuteType.visible }");
	</script>	
</div>
</div>		
<div class="form-group row">
<div class="col-sm-2 control-label"><spring:message code="label.StatuteType.specialSeasonGranted"/></div> 

<div class="col-sm-2">
<select id="statuteType_specialSeasonGranted" name="specialSeasonGranted">
<option value="true"><spring:message code="label.yes"/></option>				
<option value="false"><spring:message code="label.no"/></option>
</select>
	<script>
		$("#statuteType_specialSeasonGranted").val("${not empty param.specialSeasonGranted ? param.specialSeasonGranted : statuteType.specialSeasonGranted }");
	</script>	
</div>
</div>		
<div class="form-group row">
<div class="col-sm-2 control-label"><spring:message code="label.StatuteType.explicitCreation"/></div> 

<div class="col-sm-2">
<select id="statuteType_explicitCreation" name="explicitcreation">
<option value="true"><spring:message code="label.yes"/></option>				
<option value="false"><spring:message code="label.no"/></option>
</select>
	<script>
		$("#statuteType_explicitCreation").val("${not empty param.explicitcreation ? param.explicitcreation : statuteType.explicitCreation }");
	</script>	
</div>
</div>		
<div class="form-group row">
<div class="col-sm-2 control-label"><spring:message code="label.StatuteType.workingStudentStatute"/></div> 

<div class="col-sm-2">
<select id="statuteType_workingStudentStatute" name="workingStudentStatute">
<option value="true"><spring:message code="label.yes"/></option>				
<option value="false"><spring:message code="label.no"/></option>
</select>
	<script>
		$("#statuteType_workingStudentStatute").val("${not empty param.workingStudentStatute ? param.workingStudentStatute : statuteType.workingStudentStatute }");
	</script>	
</div>
</div>		
<div class="form-group row">
<div class="col-sm-2 control-label"><spring:message code="label.StatuteType.associativeLeaderStatute"/></div> 

<div class="col-sm-2">
<select id="statuteType_associativeLeaderStatute" name="associativeLeaderStatute">
<option value="true"><spring:message code="label.yes"/></option>				
<option value="false"><spring:message code="label.no"/></option>
</select>
	<script>
		$("#statuteType_associativeLeaderStatute").val("${not empty param.associativeLeaderStatute ? param.associativeLeaderStatute : statuteType.associativeLeaderStatute }");
	</script>	
</div>
</div>		
<div class="form-group row">
<div class="col-sm-2 control-label"><spring:message code="label.StatuteType.specialSeasonGrantedByRequest"/></div> 

<div class="col-sm-2">
<select id="statuteType_specialSeasonGrantedByRequest" name="specialSeasonGrantedByRequest">
<option value="true"><spring:message code="label.yes"/></option>				
<option value="false"><spring:message code="label.no"/></option>
</select>
	<script>
		$("#statuteType_specialSeasonGrantedByRequest").val("${not empty param.specialSeasonGrantedByRequest ? param.specialSeasonGrantedByRequest : statuteType.specialSeasonGrantedByRequest }");
	</script>	
</div>
</div>		
<div class="form-group row">
<div class="col-sm-2 control-label"><spring:message code="label.StatuteType.grantOwnerStatute"/></div> 

<div class="col-sm-2">
<select id="statuteType_grantOwnerStatute" name="grantOwnerStatute">
<option value="true"><spring:message code="label.yes"/></option>				
<option value="false"><spring:message code="label.no"/></option>
</select>
	<script>
		$("#statuteType_grantOwnerStatute").val("${not empty param.grantOwnerStatute ? param.grantOwnerStatute : statuteType.grantOwnerStatute }");
	</script>	
</div>
</div>		
<div class="form-group row">
<div class="col-sm-2 control-label"><spring:message code="label.StatuteType.seniorStatute"/></div> 

<div class="col-sm-2">
<select id="statuteType_seniorStatute" name="seniorStatute">
<option value="true"><spring:message code="label.yes"/></option>				
<option value="false"><spring:message code="label.no"/></option>
</select>
	<script>
		$("#statuteType_seniorStatute").val("${not empty param.seniorStatute ? param.seniorStatute : statuteType.seniorStatute }");
	</script>	
</div>
</div>	
<div class="form-group row">
<div class="col-sm-2 control-label"><spring:message code="label.StatuteType.handicappedStatute"/></div> 

<div class="col-sm-2">
<select id="statuteType_handicappedStatute" name="handicappedStatute">
<option value="true"><spring:message code="label.yes"/></option>				
<option value="false"><spring:message code="label.no"/></option>
</select>
	<script>
		$("#statuteType_handicappedStatute").val("${not empty param.handicappedStatute ? param.handicappedStatute : statuteType.handicappedStatute }");
	</script>	
</div>
</div>
  </div>
  <div class="panel-footer">
		<input type="submit" class="btn btn-default" role="button" value="<spring:message code="label.submit" />"/>
	</div>
</div>
</form>

<script>
$(document).ready(function() {

	
	
	});
</script>