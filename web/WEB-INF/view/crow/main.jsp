<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017-04-21
  Time: 오후 4:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
.list-section {height:400px; margin-bottom: 1%;}
.list-main {width:30%; display: inline-block; margin-right: 2%;}
.list-section .list-main:LAST-CHILD {margin-right:0;}
.list-main img {width:100%; height:200px; border:1px solid #000;}
.tags {float:left; clear:both;}
.category {float:right;}
</style>
<script>
$(function() {
	var initList=function() {
		$.ajax({
			url:"cListInit.do",
			method: "post",
			data: {},
			success: function(data) {
				var str="";
				$.each(data, function(index, val) {
					if(index % 3 == 0) {
						str += "<div class='col-md-12 list-section'>";
					}
					str += "<div class='list-main'>" +
					"<img class='card-img-top img-fluid' alt=''>"+
					"<div class='card-block'>"+val.title+"</div>"+
					"<div class='card-block tags'>"+val.goalmoney+"</div>"+
					"<div class='card-block'><span class='tags'>"+val.tag+"</span><span class='category'>"+val.category+"</span></div>"+
					"</div>";
					if(index % 3 == 2) {
						str += "</div>"
					}
				})
				$('#crowdlist').html(str);
			},error:function(a,b,c){
				
			}
		})
	};
	
	initList();
})
</script>

<div class="card-columns mb-3" id="crowdlist">

</div>
<div class="card">
    <img class="card-img-top img-fluid" src="//placehold.it/600x200/444/fff?text=..." alt="Card image cap">
    <div class="card-block">
        <h4 class="card-title">New XL Grid Tier</h4>
        <p class="card-text">With screens getting smaller, Bootstrap 4 introduces a new grid breakpoint with the
            col-xl-* classes. This extra tier extends the media query range all the way down to 576 px. Eventhough the
            new XL tier would make one think it’s been added to support extra large screens, it’s actually the
            opposite.</p>
    </div>
</div>
<div class="card card-block">
    <blockquote class="card-blockquote">
        <p>Bootstrap 4 will be lighter and easier to customize.</p>
        <footer>
            <small class="text-muted">
                Someone famous like <cite title="Source Title">Mark Otto</cite>
            </small>
        </footer>
    </blockquote>
</div>
<div class="card">
    <img class="card-img-top img-fluid" src="//placehold.it/600x200/bbb/fff?text=..." alt="Card image cap">
    <div class="card-block">
        <h4 class="card-title">Card title</h4>
        <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
        <p class="card-text">
            <small class="text-muted">Last updated 3 mins ago</small>
        </p>
    </div>
</div>
<div class="card card-block card-inverse card-primary text-center">
    <blockquote class="card-blockquote">
        <p>Create masonry or Pinterest-style card layouts in Bootstrap 4.</p>
        <footer>
            <small>
                Someone famous in <cite title="Source Title">Bootstrap</cite>
            </small>
        </footer>
    </blockquote>
</div>
<div class="card card-block text-center">
    <h4 class="card-title">Clever heading</h4>
    <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
    <p class="card-text">
        <small class="text-muted">Last updated 5 mins ago</small>
    </p>
</div>
<div class="card">
    <img class="card-img img-fluid" src="//placehold.it/600x200/777/fff?text=..." alt="Card image">
</div>
<div class="card card-block text-right">
    <blockquote class="card-blockquote">
        <p>There are also some interesting new text classes to uppercase or capitalize.</p>
        <footer>
            <small class="text-muted">
                Someone famous in <cite title="Source Title">Bootstrap</cite>
            </small>
        </footer>
    </blockquote>
</div>
<div class="card card-block">
    <h4 class="card-title">Responsive</h4>
    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content.
        This card has even longer content than the first to show that equal height action.</p>
    <p class="card-text">
        <small class="text-muted">Last updated 3 mins ago</small>
    </p>
</div>
<div class="card">
    <div class="card-block">
        <ul class="list-unstyled">
            <li class="text-capitalize"><code class="text-lowercase">text-capitalize</code> Capitalize each word</li>
            <li class="text-uppercase"><code class="text-lowercase">text-uppercase</code> Uppercase text</li>
            <li class="text-success"><code>text-success</code> Contextual colors for text</li>
            <li><code>text-muted</code> <span class="text-muted">Lighten with muted</span></li>
            <li><code>text-info</code> <span class="text-muted">Info text color</span></li>
            <li><code>text-danger</code> <span class="text-muted">Danger text color</span></li>
            <li><code>text-warning</code> <span class="text-muted">Warning text color</span></li>
            <li><code>text-primary</code> <span class="text-primary">Primary text color</span></li>
        </ul>
    </div>
</div>
<div class="card card-block">
    <h4 class="card-title">Heading</h4>
    <p class="card-text">So now that you've seen some of what Bootstrap 4 has to offer, are you going to give it a
        try?</p>
    <p class="card-text">
        <small class="text-muted">Last updated 12 mins ago</small>
    </p>
</div>
</div>