<%--

    Copyright © 2017 Instituto Superior Técnico

    This file is part of FenixEdu Academic.

    FenixEdu Academic is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    FenixEdu Academic is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with FenixEdu Academic.  If not, see <http://www.gnu.org/licenses/>.

--%>
<%@page import="org.fenixedu.academic.domain.accounting.PaymentMethod"%>
<%@ taglib uri="http://fenix-ashes.ist.utl.pt/fenix-renderers" prefix="fr" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>

<link rel="stylesheet" type="text/css" media="screen" href="<%= request.getContextPath() %>/CSS/accounting.css"/>


<spring:url var="backUrl" value="../../../{event}/details">
    <spring:param name="event" value="${eventId}"/>
</spring:url>

<div class="container-fluid">
    <header>
        <h1>
            <jsp:include page="heading-event.jsp"/>
            <c:if test="${event.currentEventState == 'CANCELLED'}">
                <span class="text-danger"> (Cancelada)</span>
            </c:if>
        </h1>
    </header>
    <c:set var="person" scope="request" value="${event.person}"/>
    <jsp:include page="heading-person.jsp"/>
        <div class="row">
            <div class="col-md-12">
                <h2>
                    <spring:message code="accounting.payment.details.title" text="Payment report"/>
                </h2>
            </div>
        </div>
    <div class="row">
        <div class="col-md-5">
            <section class="payment-metadata">
                <dl>
                    <dt>Responsável:</dt>
                    <dd><c:out value="${transactionDetail.responsibleUser.person.presentationName}"/></dd>
                </dl>
                <dl>
                    <dt>Método Pagamento:</dt>
                    <dd><c:out value="${transactionDetail.transactionDetail.paymentMethod.localizedName}"/></dd>
                </dl>
                <dl>
                    <dt>Referência Pagamento:</dt>
                    <dd><c:out value="${transactionDetail.transactionDetail.paymentReference}"/></dd>
                </dl>
                <c:if test="${transactionDetail.transactionDetail.paymentMethod.sibs}">
                    <dl>
                        <dt>Transacção SIBS:</dt>
                        <dd><c:out value="${transactionDetail.transactionDetail.sibsTransactionId}"/></dd>
                    </dl>
                    <dl>
                        <dt>Referência:</dt>
                        <dd><c:out value="${transactionDetail.transactionDetail.sibsCode}"/></dd>
                    </dl>
                </c:if>
                <c:if test="${transactionDetail.transactionDetail.paymentMethod.cash}">
                    <dl>
                        <dt>Motivo:</dt>
                        <dd><c:out value="${transactionDetail.transactionDetail.comments}"/></dd>
                    </dl>
                </c:if>
                <dl>
                    <dt>Data de pagamento:</dt>
                    <dd>
                        <time datetime="${registeredDate.toString('yyyy-MM-dd')}">${registeredDate.toString('dd/MM/yyyy')}</time>
                    </dd>
                </dl>
                <dl>
                    <dt>Data de processamento:</dt>
                    <dd>
                        <time datetime="${processedDate.toString('yyyy-MM-dd HH:mm:ss')}">${processedDate.toString('dd/MM/yyyy HH:mm:ss')}</time>
                    </dd>
                </dl>

                <c:if test="${not empty sourceRefund}">
                <dl>
                    <dt>Reembolso de:</dt>
                    <dd>
                        <spring:url value="../../../{event}/transaction/{refundId}/details" var="sourceRefundUrl">
                            <spring:param name="event" value="${sourceRefund.event.externalId}"/>
                            <spring:param name="refundId" value="${sourceRefund.externalId}"/>
                        </spring:url>
                        <a href="${sourceRefundUrl}"><c:out value="${sourceRefund.event.description}"/></a>
                    </dd>
                </dl>
                </c:if>
            </section>
        </div>
        <div class="col-md-2 col-md-offset-2">
            <section class="payment-totals">
                <dl class="total">
                    <dt><spring:message code="accounting.payment.details.paid.value" text="Paid Amount"/></dt>
                    <dd><c:out value="${amount}"/><span>€</span></dd>
                </dl>
                <c:forEach var="payment" items="${payments}" varStatus="paymentLoop">
                    <c:set var="totalPaidAmount" value="#{payment.amountUsedInDebt + payment.amountUsedInInterest + payment.amountUsedInFine + payment.amountUsedInAdvance}"/>
                    <dl>
                        <dt><c:out value="${payment.debtEntry.description}"/></dt>
                        <dd><c:out value="${totalPaidAmount.toPlainString()}"/><span>€</span></dd>
                    </dl>
                </c:forEach>
            </section>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <header>
                <h2>Prestações e Reembolsos</h2>
            </header>
        </div>
    </div>
    <section class="payment-values">
        <table class="table">
            <thead>
            <tr>
                <th>Descrição</th>
                <th>Data</th>
                <th>Total</th>
                <th>Dívida</th>
                <th>Juros/Multas</th>
                <th>Adiantamento</th>
                <th><span class="sr-only">Acções</span></th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${empty payments}">
                <tr>
                    <td colspan="6">Não existem prestações associadas.</td>
                </tr>
                </c:if>
            <c:if test="${not empty payments}">
                <c:forEach var="payment" items="${payments}" varStatus="paymentLoop">
                    <c:set var="amountUsedInInterestOrFine" value="#{payment.amountUsedInInterest + payment.amountUsedInFine}"/>
                    <c:set var="totalPaidAmount" value="#{payment.amountUsedInDebt + payment.amountUsedInInterest + payment.amountUsedInFine + payment.amountUsedInAdvance}"/>
                    <c:set var="totalAdvanceAmount" value="#{payment.amountUsedInDebt + payment.amountUsedInInterest + payment.amountUsedInFine + payment.amountUsedInAdvance}"/>

                    <tr>
                        <td>
                            <c:out value="${payment.debtEntry.description}"/>
                        </td>
                        <td>
                            <time datetime="${payment.debtEntry.date.toString('yyyy-MM-dd')}">${payment.debtEntry.date.toString('dd/MM/yyyy')}</time>
                        </td>
                        <td><c:out value="${totalPaidAmount.toPlainString()}"/><span>€</span></td>
                        <td><c:out value="${payment.amountUsedInDebt.toPlainString()}"/><span>€</span></td>
                        <td><c:out value="${amountUsedInInterestOrFine}"/><span>€</span></td>
                        <td><c:out value="${payment.amountUsedInAdvance.toPlainString()}"/><span>€</span></td>


                        <spring:url value="../../../{event}/transaction/{id}/details" var="debtUrl">
                            <spring:param name="event" value="${event.externalId}"/>
                            <spring:param name="id" value="${payment.debtEntry.id}"/>
                        </spring:url>

                        <td style="text-align: right;">
                            <a href="${debtUrl}">
                                <spring:message code="label.details"/>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
            </tbody>
        </table>
    </section>
    </main>
</div>