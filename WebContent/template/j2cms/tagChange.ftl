 <DIV id="NewsTop">
    <DIV id="NewsTop_tit"><P class="topTit">关注焦点</P>

      <P class="topC0">浏览最多</P>
      <P class="topC0">评论最多</P>
    </DIV>
    <DIV id=NewsTop_cnt><SPAN title="Don't delete me"></SPAN>
<!-- for -->
       <SPAN>
       	   <#if mostVisitArticles?? >
	       <#list mostVisitArticles as a>
	       		<A href="/Article/${a.id?c}.html" target="_blank">${a.title}</A><br/>
	       </#list>
	       </#if>
       </SPAN>
       <SPAN>
	       <#if mostCommentArticles?? >
	       <#list mostCommentArticles as a>
	       		<A href="/Article/${a.id?c}.html" target="_blank">${a.title}</A><br/>
	       </#list>
	       </#if>
       </SPAN>
<!-- end -->

		</DIV>
            <SCRIPT>
				var Tags=document.getElementById('NewsTop_tit').getElementsByTagName('p'); 
				var TagsCnt=document.getElementById('NewsTop_cnt').getElementsByTagName('span'); 
				var len=Tags.length; 
				var flag=1;//修改默认值
				for(i=1;i<len;i++){
					Tags[i].value = i;
					Tags[i].onmouseover=function(){changeNav(this.value)}; 
					TagsCnt[i].className='undis';					
				}
				Tags[flag].className='topC1';
				TagsCnt[flag].className='dis';
				function changeNav(v){	
					Tags[flag].className='topC0';
					TagsCnt[flag].className='undis';
					flag=v;	
					Tags[v].className='topC1';
					TagsCnt[v].className='dis';
				}
			</SCRIPT>
  </DIV>