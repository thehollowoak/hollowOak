<meta name="layout" content="home"/>
<div class="row well well-lg">
    <div class="col-sm-10 col-sm-offset-1">
    <g:form action="varify" method="POST">
        <div class="form-group">
            <label for="username"> Username </label>
            <g:textField class="form-control" name="username"/>
        </div>
        <div class="form-group">
            <label for="password"> Password </label>
            <g:field type="password" class="form-control" name="password"/>
        </div>
        <button type="submit" class="btn btn-primary"> Login </button>
    </g:form>
    </div>
</div>