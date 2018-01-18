<meta name="layout" content="home"/>
<div class="row well well-lg">
    <div class="col-sm-10 col-sm-offset-1">
    <g:form action="create" method="POST">
        <div class="form-group">
            <label for="name"> Name </label>
            <g:textField class="form-control" name="name"/>
        </div>
        <div class="form-group">
            <label for="img"> Image </label>
            <g:textField class="form-control" name="img"/>
        </div>
        <div class="form-group">
            <label for="price"> Price </label>
            <g:textField class="form-control" name="price"/>
        </div>
        <div class="form-group">
            <label for="description"> Description </label>
            <g:textArea class="form-control" name="description"/>
        </div>
        <button type="submit" class="btn btn-primary"> Save </button>
    </g:form>
    </div>
</div>