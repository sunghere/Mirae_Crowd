<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017-05-16
  Time: 오후 1:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<script type="text/javascript"
        src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>

<script>


    $(function () {
        var init=function(){

            CKEDITOR.replace( 'ckedtest', {
                width:'100%',
                height:'400px',
                filebrowserUploadUrl: 'imageUpload.do',
            })

        };


        $("#typetest").click(function(){
            alert(CKEDITOR.instances.ckedtest.getData());
        });

        init();
    });


</script>

<form>
    <input type="button" id="typetest" value="타입 확인" />

    <textarea id='ckedtest'>

</textarea>

</form>
