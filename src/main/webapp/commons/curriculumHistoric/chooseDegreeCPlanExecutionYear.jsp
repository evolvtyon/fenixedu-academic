<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://fenix-ashes.ist.utl.pt/fenix-renderers" prefix="fr" %>

<html:xhtml/>

<h2><bean:message key="title.student.marksSheetConsult"/></h2>

<logic:messagesPresent message="true">
	<p>
		<span class="error0"><!-- Error messages go here -->
			<html:messages id="message" message="true">
				<bean:write name="message"/>
			</html:messages>
		</span>
	<p>
</logic:messagesPresent>


<fr:form action="/chooseExecutionYearAndDegreeCurricularPlan.do?method=showActiveCurricularCourseScope">
	
	<fr:edit id="academicInterval"
			 name="executionDegreeBean"
			 type="net.sourceforge.fenixedu.dataTransferObject.administrativeOffice.lists.ExecutionDegreeListBean"
			 schema="choose.degreeCurricularPlan">
		<fr:destination name="degreePostBack" path="/chooseExecutionYearAndDegreeCurricularPlan.do?method=chooseDegree"/>
        <fr:destination name="curricularPlanPostBack" path="/chooseExecutionYearAndDegreeCurricularPlan.do?method=chooseDegreeCurricularPlan"/>
		<fr:layout name="tabular">
			<fr:property name="classes" value="tstyle5 thlight thright thmiddle mtop025"/>
	        <fr:property name="columnClasses" value="width12em,,tdclear tderror1"/>
		</fr:layout>
	</fr:edit>
	
	<html:submit><bean:message key="button.submit" bundle="ACADEMIC_OFFICE_RESOURCES"/></html:submit>		

</fr:form>