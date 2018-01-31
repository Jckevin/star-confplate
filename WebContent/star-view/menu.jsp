<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${!(empty sessionScope.menutree)}">
	<c:set var="tree" value="${sessionScope.menutree}" />
</c:if>
<c:set var="currLang" value="zh_CN" />
<c:if test="${!(empty sessionScope.langSet)}">
	<c:set var="currLang" value="${sessionScope.langSet}" />
</c:if>
<c:set var="currMenu" value="${menu}" />
<c:set var="currNode" value="${node}" />
<c:set var="currFunc" value="${func}" />
<!-- take care that if first level menu has no sub menu ,the class dropdown-toggle will make a bug -->
<ul class="nav nav-list">

	<c:forEach items="${menutree}" var="tree">
		<c:set var="menuName" value="${tree.name}" />
		<c:choose>
			<c:when test="${currMenu==menuName}">
				<li class="active open">
			</c:when>
			<c:otherwise>
				<li>
			</c:otherwise>
		</c:choose>

		<a href="#" id="${tree.name}" class="dropdown-toggle"> <i
			class="${tree.style}"></i> <span><fmt:message
					key="${tree.name}" bundle="${lbdl}" /></span>
		</a>
		<b class="arrow"></b>

		<ul class="submenu">
			<c:forEach items="${tree.node}" var="subTree">
				<c:set var="nodeName" value="${subTree.name}" />
				<c:choose>
					<c:when test="${currNode==nodeName}">
						<li class="active">
					</c:when>
					<c:otherwise>
						<li>
					</c:otherwise>
				</c:choose>

				<a class="ajaxNode" id="${subTree.name}" href="${subTree.action}">
					<i class="${subTree.style}"></i> <fmt:message key="${subTree.name}"
						bundle="${lbdl}" />
				</a>
				<b class="arrow"></b>
				</li>
			</c:forEach>
		</ul>

		</li>
	</c:forEach>

	<!-- <li class="active open"><a href="#" class="dropdown-toggle"> -->

</ul>

<!-- The area used for extra data post -->
<div>
	<input type="text" id="currentMenu" value="${currMenu}" style="display: none;" />
	<input type="text" id="currentNode" value="${currNode}" style="display: none;" />
	<input type="text" id="currentFunc" value="${currFunc}" style="display: none;" />
	<input type="text" id="currentLang" value="${currLang}" style="display: none" />
</div>

<!-- /.nav-list -->
<script type="text/javascript">
	$(".ajaxNode").click(function(e) {
		e.preventDefault();

		var act = $(this).attr("href");
		var node = $(this).attr("id");
		var menu = $(this).parents("ul").siblings("a").attr("id");

		window.location.href = act + "?menu=" + menu + "&node=" + node;

	});
</script>