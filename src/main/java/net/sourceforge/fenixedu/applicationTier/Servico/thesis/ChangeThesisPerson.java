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
package net.sourceforge.fenixedu.applicationTier.Servico.thesis;

import net.sourceforge.fenixedu.applicationTier.Servico.exceptions.FenixServiceException;
import net.sourceforge.fenixedu.domain.DegreeCurricularPlan;
import net.sourceforge.fenixedu.domain.Person;
import net.sourceforge.fenixedu.domain.person.RoleType;
import net.sourceforge.fenixedu.domain.thesis.Thesis;
import net.sourceforge.fenixedu.domain.thesis.ThesisEvaluationParticipant;
import net.sourceforge.fenixedu.domain.thesis.ThesisParticipationType;
import net.sourceforge.fenixedu.injectionCode.AccessControl;
import pt.ist.fenixframework.Atomic;

public class ChangeThesisPerson {

    public static enum PersonTarget {
        orientator, coorientator, president, vowel
    };

    public static class PersonChange {
        PersonTarget type;
        Person person;
        ThesisEvaluationParticipant target;

        public PersonChange(PersonTarget type, Person person, ThesisEvaluationParticipant target) {
            super();

            this.type = type;
            this.person = person;
            this.target = target;
        }
    }

    @Atomic
    public static void run(DegreeCurricularPlan degreeCurricularPlan, Thesis thesis, PersonChange change)
            throws FenixServiceException {
        Person person = change.person;

        if (!AccessControl.getPerson().hasRole(RoleType.SCIENTIFIC_COUNCIL)) {
            thesis.checkIsScientificCommission();
        }

        switch (change.type) {
        case orientator:
            thesis.setOrientator(person);
            break;
        case coorientator:
            thesis.setCoorientator(person);
            break;
        case president:
            thesis.setPresident(person);
            break;
        case vowel:
            if (change.target != null) {
                change.target.delete();
                if (person != null) {
                    thesis.addVowel(person);
                }
            } else {
                if (person != null) {
                    thesis.addVowel(person);
                }
            }

            break;
        }
    }

    @Atomic
    public static void remove(final ThesisEvaluationParticipant thesisEvaluationParticipant) {
        final Thesis thesis = thesisEvaluationParticipant.getThesis();
        if (!AccessControl.getPerson().hasRole(RoleType.SCIENTIFIC_COUNCIL)) {
            thesis.checkIsScientificCommission();
        }
        thesisEvaluationParticipant.delete();

        if (!thesis.isCreditsDistributionNeeded()) {
            thesis.setCoorientatorCreditsDistribution(null);
        }
    }

    @Atomic
    public static void add(final Thesis thesis, final ThesisParticipationType thesisParticipationType, final Person person) {
        if (person != null) {
            if (!AccessControl.getPerson().hasRole(RoleType.SCIENTIFIC_COUNCIL)) {
                thesis.checkIsScientificCommission();
            }

            new ThesisEvaluationParticipant(thesis, person, thesisParticipationType);

            if (!thesis.isCreditsDistributionNeeded()) {
                thesis.setCoorientatorCreditsDistribution(null);
            }
        }
    }
}