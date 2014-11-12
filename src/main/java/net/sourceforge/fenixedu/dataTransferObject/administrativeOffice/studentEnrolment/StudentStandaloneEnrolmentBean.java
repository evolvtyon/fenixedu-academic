/**
 * Copyright © 2002 Instituto Superior Técnico
 *
 * This file is part of FenixEdu Core.
 *
 * FenixEdu Core is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * FenixEdu Core is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with FenixEdu Core.  If not, see <http://www.gnu.org/licenses/>.
 */
package net.sourceforge.fenixedu.dataTransferObject.administrativeOffice.studentEnrolment;

import net.sourceforge.fenixedu.domain.ExecutionSemester;
import net.sourceforge.fenixedu.domain.StudentCurricularPlan;
import net.sourceforge.fenixedu.domain.curricularRules.executors.ruleExecutors.CurricularRuleLevel;
import net.sourceforge.fenixedu.domain.studentCurriculum.NoCourseGroupCurriculumGroup;
import net.sourceforge.fenixedu.domain.studentCurriculum.NoCourseGroupCurriculumGroupType;

public class StudentStandaloneEnrolmentBean extends StudentOptionalEnrolmentBean implements NoCourseGroupEnrolmentBean {

    static private final long serialVersionUID = 1L;

    public StudentStandaloneEnrolmentBean(final StudentCurricularPlan studentCurricularPlan,
            final ExecutionSemester executionSemester) {
        setStudentCurricularPlan(studentCurricularPlan);
        setExecutionPeriod(executionSemester);
    }

    @Override
    public NoCourseGroupCurriculumGroupType getGroupType() {
        return NoCourseGroupCurriculumGroupType.STANDALONE;
    }

    @Override
    public NoCourseGroupCurriculumGroup getNoCourseGroupCurriculumGroup() {
        return getStudentCurricularPlan().getNoCourseGroupCurriculumGroup(getGroupType());
    }

    @Override
    public CurricularRuleLevel getCurricularRuleLevel() {
        return super.getCurricularRuleLevel() != null ? super.getCurricularRuleLevel() : getGroupType().getCurricularRuleLevel();
    }
}