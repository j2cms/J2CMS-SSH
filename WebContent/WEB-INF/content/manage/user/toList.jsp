<%@ page pageEncoding="utf-8"%>
<script>
alert("操作成功!");
location.href="list?selector.id=${selector.id}&selector.username=${selector.username}&selector.group.id=${selector.group.id}&selector.gender=${selector.gender}&selector.realName=${selector.realName}&selector.birthday=${selector.birthday}&selector.email=${selector.email}&selector.telephone=${selector.telephone}&selector.QQ=${selector.QQ}&selector.address=${selector.address}&selector.zipCode=${selector.zipCode}&selector.checkState=${selector.checkState}&pageView.maxresult=${pageView.maxresult}&pageView.currentpage=${pageView.currentpage}";
</script>
