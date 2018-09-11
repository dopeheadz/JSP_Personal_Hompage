<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand-lg navbar-light navbar-transparent navbar-sticky single-header">
	<a class="navbar-brand" href="/">
		<img src="../../../images/logo-light.png" alt="" class="logo-visible-desktop logo-default">
		<img src="../../../images/logo.png" alt="" class="logo-hidden-desktop logo-scroll">
	</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
			aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarCollapse">
		<ul class="navbar-nav  ml-auto">
			<li class="nav-item active">
				<a class="nav-link" href="../../../index.jsp">홈 </a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">프로필 </a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="#">포트폴리오 </a>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="/">커뮤니티 </a>

				<ul class="dropdown-menu">
					<li><a href="#" class="dropdown-item"><i class="fa fa-comments-o mr-2 text-muted"></i> 게시판</a>
					</li>
					<li><a href="gallery.jsp" class="dropdown-item"><i class="fa fa-image mr-2 text-muted"></i> 갤러리</a>
					</li>
				</ul>
			</li>

			<% if (session.isNew() || session.getAttribute("userID") == null) { %>
			<li class="nav-item dropdown"><a href="#" data-toggle="dropdown"
											 class=" dropdown-toggle btn btn-xs btn-primary">
				<p data-toggle="tooltip" data-placement="bottom" title="로그인"><i class="fa fa-sign-in mr-1"></i>로그인</p></a>
				<div class="dropdown-menu dropdown-form dropdown-menu-right">
					<div class="card card-account">
						<div class="card-body">
							<form action="/log" method="post">
								<div class="form-group mb10">
									<label for="username">Username</label>
									<input id="username" name="id" type="text" class="form-control" placeholder="아이디"
										   value="<%=id %>">
								</div>
								<div class="form-group mb10">
									<label for="password">Password</label>
									<input id="password" name="pwd" type="password" class="form-control"
										   placeholder="비밀번호">
								</div>
								<div class="form-group mb10">
									<label class="checkbox">
										<input type="checkbox" value="on" id="rememberMe" name="ck_id" <%=chk %>> 아이디저장
									</label>
								</div>
								<button type="submit" class="btn btn-block btn-secondary btn-rounded">Sign In</button>
							</form>
							<p class="mb0 text-small">아이디가 기억나지 않으세요? <a href="../../../user/register.jsp" class="btn btn-underline">회원가입</a>
							</p>
							<p class="mb0 text-small">아이디가 기억나지 않으세요? <a href="#" class="btn btn-underline">ID찾기</a></p>
							<p class=" text-small mb0">비밀번호가 기억나지 않으세요? <a href="#" class="btn btn-underline">비밀번호찾기</a>
							</p>
							<hr>
							<div class="text-center mb10">Or Login with</div>
							<a href="#" class="btn btn-social facebook btn-block"><i class="fa fa-facebook"></i>Login
							with facebook</a>
							<a href="#" class="btn btn-social twitter btn-block"><i class="fa fa-twitter"></i>Login with
							Twitter</a>
						</div>
					</div>
				</div>
				<a href="../../../user/register.jsp"><button type="button" class="btn btn-xs btn-primary"><i class="fa fa-user mr-1"></i>회원가입</button></a>
			</li>
			<%} else { %>
			<li class="nav-item"><a href="/log" class=" btn btn-primary btn-lg">Sign Out</a></li>
			<% } %>
		</ul>

	</div>
	<div class="navbar-right-col">
		<ul class="list-inline">

			<li class="list-inline-item">
				<a href="shop-cart.html"><i class="fa fa-shopping-basket"></i> <span class="badge badge-primary">2</span></a>
			</li>
			<li class="list-inline-item dropdown dropdown-search">
				<a href="#" data-toggle="dropdown" class="dropdown-toggle"><i class="fa fa-search"></i></a>
				<div class="dropdown-menu search-dropdown-menu dropdown-menu-left">
					<form role="form">
						<input type="text" class="form-control" placeholder="Search...">
						<button type="submit" class="btn-nav-search"><i class="fa fa-search"></i></button>
					</form>
				</div>
			</li>
		</ul>
	</div>
</nav>