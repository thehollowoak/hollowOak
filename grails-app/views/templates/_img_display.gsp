<div class="col-sm-6">
    <g:each var="pic" in="${pics}" status="i">
        <asset:image src="${pic.file}" alt="${item.name}" width="100%" id="pic${i+1}" class="viewPic ${i!=0 ? 'hidden' : ''}"/>
    </g:each>
    <g:if test="${pics.size()>1}">
        <div class="text-center">
            <div class="btn-group" role="group">
                <g:each var="i" in="${1..pics.size()}">
                    <button type="button" class="btn btn-info img-btn ${i==1 ? 'active' : ''}" id="btn${i}" onClick="changePic('${i}')"></button>
                </g:each>
            </div>
        </div>
    </g:if>
</div>