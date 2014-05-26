package net.sourceforge.fenixedu.dataTransferObject.administrativeOffice.lists;

import java.io.Serializable;

import org.fenixedu.spaces.domain.Space;

import net.sourceforge.fenixedu.domain.CompetenceCourse;
import net.sourceforge.fenixedu.domain.CurricularCourse;
import net.sourceforge.fenixedu.domain.Degree;
import net.sourceforge.fenixedu.domain.ExecutionSemester;
import net.sourceforge.fenixedu.domain.Person;

/**
 * 
 * @author - Shezad Anavarali (shezad@ist.utl.pt)
 * 
 */
@SuppressWarnings("serial")
public class SearchCourseResponsiblesParametersBean implements Serializable {

    private ExecutionSemester executionSemester;

    private Person responsible;

    private CurricularCourse curricularCourse;

    private CompetenceCourse competenceCourse;

    private final Space campus;

    private final Degree degree;

    public SearchCourseResponsiblesParametersBean(CurricularCourse curricularCourse, CompetenceCourse competenceCourse,
            Person responsible, ExecutionSemester executionSemester, Space campus, Degree degree) {
        this.executionSemester = executionSemester;
        this.curricularCourse = curricularCourse;
        this.responsible = responsible;
        this.competenceCourse = competenceCourse;
        this.campus = campus;
        this.degree = degree;
    }

    public void setExecutionSemester(ExecutionSemester executionSemester) {
        this.executionSemester = executionSemester;
    }

    public ExecutionSemester getExecutionSemester() {
        return executionSemester;
    }

    public void setResponsible(Person responsible) {
        this.responsible = responsible;
    }

    public Person getResponsible() {
        return responsible;
    }

    public void setCurricularCourse(CurricularCourse curricularCourse) {
        this.curricularCourse = curricularCourse;
    }

    public CurricularCourse getCurricularCourse() {
        return curricularCourse;
    }

    public void setCompetenceCourse(CompetenceCourse competenceCourse) {
        this.competenceCourse = competenceCourse;
    }

    public CompetenceCourse getCompetenceCourse() {
        return competenceCourse;
    }

    public Space getCampus() {
        return campus;
    }

    public Degree getDegree() {
        return degree;
    }

}