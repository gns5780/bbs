<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript">
	if ('${msg}' != ''){
		alert('${msg}');
	}
	else if ('${param.msg}' != ''){
		alert('${param.msg}');
	}
	
</script>