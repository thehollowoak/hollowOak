<meta name="layout" content="home"/>

<g:set var="video_games" value="${['Legend of Zelda', 'Portal', 'Pokemon']}" />
<g:set var="tv_shows" value="${['Doctor Who', 'Supernatural']}" />
<g:set var="cartoons" value="${['Adventure Time', 'Steven Universe']}" />
<g:set var="categories" value="${['Video Games': video_games, 'TV shows': tv_shows, 'Cartoons': cartoons]}" />

<div class="row well well-lg padding">
    <h1> Categories </h1>
    <ul class="list-group">
    <g:each var="category" in="${categories}">
        <li class="list-group-item"> ${category.key}
            <ul>
            <g:each var="title" in="${category.value}">
                <g:link action="category" params='[title: "${title}", for_sale: "true"]' 
                    class="list-group-item list-group-item-action"> ${title} </g:link> 
            </g:each>
            </ul> 
        </li>
    </g:each>
    </ul>
</div>