<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<logic:messagesPresent message="true">
		<ul>
			<html:messages id="messages" message="true">
				<li><span class="error0"><bean:write name="messages" /></span></li>
			</html:messages>
		</ul>
		<br />
</logic:messagesPresent>
	
	<br/><br/>
	<html:link page="/createClassificationsForStudents.do?method=prepare"><bean:message key="button.createClassifications" bundle="MANAGER_RESOURCES" /></html:link>

			
			<strong>
				<bean:write name="infoStudentCurricularPlan" property="studentCurricularPlan.registration.student.person.name" /> - 
				# <bean:write name="infoStudentCurricularPlan" property="studentCurricularPlan.registration.number" />
				(ID:<bean:write name="infoStudentCurricularPlan" property="studentCurricularPlan.registration.idInternal" />)
			</strong>
						
						<logic:equal name="infoStudentCurricularPlan" property="studentCurricularPlan.boxStructure" value="true">
							<strong>BOX STRUCTURE</strong>	
						</logic:equal>