/**
 * Copyright © 2002 Instituto Superior Técnico
 *
 * This file is part of FenixEdu Academic.
 *
 * FenixEdu Academic is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * FenixEdu Academic is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with FenixEdu Academic.  If not, see <http://www.gnu.org/licenses/>.
 */
package org.fenixedu.academic.ui.renderers.providers.markSheet;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.fenixedu.academic.domain.Degree;
import org.fenixedu.academic.dto.degreeAdministrativeOffice.gradeSubmission.MarkSheetManagementBaseBean;

import pt.ist.fenixWebFramework.rendererExtensions.converters.DomainObjectKeyConverter;
import pt.ist.fenixWebFramework.renderers.DataProvider;
import pt.ist.fenixWebFramework.renderers.components.converters.Converter;

public class DegreeTypeDegreesManager implements DataProvider {

    @Override
    public Object provide(Object source, Object currentValue) {
        final MarkSheetManagementBaseBean markSheetManagementBean = (MarkSheetManagementBaseBean) source;
        if (markSheetManagementBean.getExecutionPeriod() != null) {
            List<Degree> res = new ArrayList<Degree>();
            res.addAll(Degree.readNotEmptyDegrees());
            Collections.sort(res, Degree.COMPARATOR_BY_DEGREE_TYPE_AND_NAME_AND_ID);
            return res;
        }

        return Collections.emptySet();

    }

    @Override
    public Converter getConverter() {
        return new DomainObjectKeyConverter();
    }

}
