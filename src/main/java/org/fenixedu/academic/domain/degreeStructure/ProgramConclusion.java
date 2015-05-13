package org.fenixedu.academic.domain.degreeStructure;

import java.util.Collection;
import java.util.Locale;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Stream;

import org.fenixedu.academic.domain.DegreeCurricularPlan;
import org.fenixedu.academic.domain.StudentCurricularPlan;
import org.fenixedu.academic.domain.accounting.EventTypes;
import org.fenixedu.academic.domain.exceptions.DomainException;
import org.fenixedu.academic.domain.student.Registration;
import org.fenixedu.academic.domain.student.registrationStates.RegistrationStateType;
import org.fenixedu.academic.domain.studentCurriculum.CurriculumGroup;
import org.fenixedu.academic.util.Bundle;
import org.fenixedu.bennu.core.domain.Bennu;
import org.fenixedu.bennu.core.i18n.BundleUtil;
import org.fenixedu.commons.i18n.LocalizedString;

import com.google.common.base.Strings;

/***
 * 
 * Program Conclusion
 * 
 * A program conclusion defines properties used in the conclusion process.
 * 
 * @author Sérgio Silva (sergio.silva@tecnico.ulisboa.pt)
 *
 */
public class ProgramConclusion extends ProgramConclusion_Base {

    private static final String DEGREE_NAME_TEMPLATE = "${degreeName}";

    protected ProgramConclusion() {
        super();
        setRoot(Bennu.getInstance());
    }

    public ProgramConclusion(LocalizedString name, LocalizedString description, LocalizedString graduationTitle,
            LocalizedString graduationLevel, boolean isAverageEditable, boolean isAlumniProvider, boolean isSkipValidation,
            RegistrationStateType targetState, EventTypes eventTypes) {
        this();
        edit(name, graduationTitle, description, graduationLevel, isAverageEditable, isAlumniProvider, isSkipValidation,
                targetState, eventTypes);
    }

    public void edit(LocalizedString name, LocalizedString description, LocalizedString graduationTitle,
            LocalizedString graduationLevel, boolean isAverageEditable, boolean isAlumniProvider, boolean isSkipValidation,
            RegistrationStateType targetState, EventTypes eventTypes) {
        setName(name);
        setDescription(description);
        setGraduationTitle(graduationTitle);
        setGraduationLevel(graduationLevel);
        setAverageEditable(isAverageEditable);
        setAlumniProvider(isAlumniProvider);
        setSkipValidation(isSkipValidation);
        setTargetState(targetState);
        setEventTypes(eventTypes);
    }

    public boolean isAverageEditable() {
        return getAverageEditable();
    }

    public boolean isAlumniProvider() {
        return getAlumniProvider();
    }

    public boolean isSkipValidation() {
        return getSkipValidation();
    }

    @Override
    public void setAverageEditable(boolean averageEditable) {
        super.setAverageEditable(averageEditable);
    }

    @Override
    public void setAlumniProvider(boolean alumniProvider) {
        super.setAlumniProvider(alumniProvider);
    }

    @Override
    public void setSkipValidation(boolean skipValidation) {
        super.setSkipValidation(skipValidation);
    }

    public static Stream<ProgramConclusion> conclusionsFor(StudentCurricularPlan studentCurricularPlan) {
        return curriculumGroups(studentCurricularPlan).map(CurriculumGroup::getDegreeModule).filter(Objects::nonNull)
                .map(CourseGroup::getProgramConclusion).filter(Objects::nonNull);
    }

    public static Stream<ProgramConclusion> conclusionsFor(Registration registration) {
        return conclusionsFor(registration.getLastStudentCurricularPlan());
    }

    public static Stream<ProgramConclusion> conclusionsFor(DegreeCurricularPlan degreeCurricularPlan) {
        return degreeCurricularPlan.getAllCoursesGroups().stream().map(CourseGroup::getProgramConclusion)
                .filter(Objects::nonNull);
    }

    private static Stream<CurriculumGroup> curriculumGroups(StudentCurricularPlan studentCurricularPlan) {
        return Stream.concat(Stream.of(studentCurricularPlan.getRoot()), studentCurricularPlan.getAllCurriculumGroups().stream());
    }

    public Optional<CurriculumGroup> groupFor(StudentCurricularPlan studentCurricularPlan) {
        if (studentCurricularPlan == null) {
            return Optional.empty();
        }
        return curriculumGroups(studentCurricularPlan).filter(
                cg -> cg.getDegreeModule() != null && this.equals(cg.getDegreeModule().getProgramConclusion())).findAny();
    }

    public Optional<CurriculumGroup> groupFor(Registration registration) {
        if (registration == null) {
            return Optional.empty();
        }
        return groupFor(registration.getLastStudentCurricularPlan());
    }

    public Optional<CourseGroup> groupFor(DegreeCurricularPlan degreeCurricularPlan) {
        if (degreeCurricularPlan == null) {
            return Optional.empty();
        }
        return degreeCurricularPlan.getAllCoursesGroups().stream().filter(cg -> this.equals(cg.getProgramConclusion())).findAny();
    }

    public boolean isTerminal() {
        return RegistrationStateType.CONCLUDED.equals(getTargetState());
    }

    public boolean isConclusionProcessed(Registration registration) {
        return groupFor(registration).map(CurriculumGroup::isConclusionProcessed).orElse(false);
    }

    public String getGraduationTitle(Locale locale) {
        return getGraduationTitle(locale, null);
    }

    public String getGraduationTitle(Locale locale, String degreeName) {
        String graduationTitle = getGraduationTitle().getContent(locale);

        if (Strings.isNullOrEmpty(graduationTitle)) {
            return null;
        }

        if (!Strings.isNullOrEmpty(degreeName)) {
            graduationTitle = graduationTitle.replace(DEGREE_NAME_TEMPLATE, degreeName);
        }

        return graduationTitle;
    }

    @Override
    protected void checkForDeletionBlockers(Collection<String> blockers) {
        super.checkForDeletionBlockers(blockers);
        if (!getCourseGroupSet().isEmpty()) {
            blockers.add(BundleUtil.getString(Bundle.APPLICATION, "error.program.conclusion.has.groups"));
        }
    }

    public void delete() {
        DomainException.throwWhenDeleteBlocked(getDeletionBlockers());
        setRoot(null);
        super.deleteDomainObject();
    }

}