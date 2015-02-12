package org.fenixedu.academic.json.adapters;

import org.fenixedu.academic.domain.Attends;
import org.fenixedu.academic.domain.Shift;
import org.fenixedu.academic.domain.student.StudentStatuteType;
import org.fenixedu.academic.domain.student.registrationStates.RegistrationState;
import org.fenixedu.academic.util.Bundle;
import org.fenixedu.bennu.core.annotation.DefaultJsonAdapter;
import org.fenixedu.bennu.core.i18n.BundleUtil;
import org.fenixedu.bennu.core.json.JsonBuilder;
import org.fenixedu.bennu.core.json.JsonViewer;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

@DefaultJsonAdapter(Attends.class)
public class AttendsJsonAdapter implements JsonViewer<Attends> {
    @Override
    public JsonElement view(Attends attends, JsonBuilder ctx) {
        JsonObject object = new JsonObject();
        object.addProperty("externalId", attends.getExternalId());
        object.add("person", ctx.view(attends.getRegistration().getPerson()));
        object.addProperty("number", attends.getRegistration().getNumber());

        object.add("studentGroups", ctx.view(attends.getStudentGroupsSet()));
        object.add("curricularPlan", ctx.view(attends.getStudentCurricularPlanFromAttends().getDegreeCurricularPlan()));
        object.addProperty("enrolments", attends.getRegistration().getEnrolments(attends.getExecutionYear()).size());
        RegistrationState registrationState = attends.getRegistration().getLastRegistrationState(attends.getExecutionYear());
        object.addProperty("registrationState", registrationState == null ? "" : registrationState.getStateType()
                .getDescription());

        object.addProperty("enrolmentType",
                BundleUtil.getString(Bundle.ENUMERATION, attends.getAttendsStateType().getQualifiedName()));

        object.addProperty(
                "workingStudent",
                attends.getRegistration().getStudent()
                        .hasActiveStatuteInPeriod(StudentStatuteType.WORKING_STUDENT, attends.getExecutionPeriod()));

        JsonObject shiftsByType = new JsonObject();
        attends.getExecutionCourse().getShiftTypes().forEach(shiftType -> {
            Shift shift = attends.getRegistration().getShiftFor(attends.getExecutionCourse(), shiftType);
            if (shift != null) {
                shiftsByType.add(shiftType.getName(), ctx.view(shift, ShiftShortJsonAdapter.class));
            } else {
                shiftsByType.add(shiftType.getName(), new JsonObject());
            }

        });
        object.add("shifts", shiftsByType);

        return object;
    }
}