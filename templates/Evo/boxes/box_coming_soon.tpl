{if isset($oBox->Artikel->elemente)}
    {lang key="upcomingProducts" section="global" assign='slidertitle'}
    
    {assign var='moreLink' value=null}
    {assign var='moreTitle' value=null}
    {if isset($oBox->cURL)}
        {assign var='moreLink' value=$oBox->cURL}
        {lang key='showAllUpcomingProducts' section='global' assign='moreTitle'}
    {/if}
    {include file='snippets/product_slider.tpl' id='boxslider-comingsoon' productlist=$oBox->Artikel->elemente title=$slidertitle tplscope='box' moreLink=$moreLink moreTitle=$moreTitle}
{elseif isset($Boxen.ErscheinendeProdukte->Artikel->elemente)}
    {lang key="upcomingProducts" section="global" assign='slidertitle'}
    {include file='snippets/product_slider.tpl' id='boxslider-comingsoon' productlist=$Boxen.ErscheinendeProdukte->Artikel->elemente title=$slidertitle tplscope='box'}
    {*
    <a href="{$Boxen.ErscheinendeProdukte->cURL}">{lang key="showAllUpcomingProducts" section="global"}</a>
    *}
{/if}