{* nur anzeigen, wenn >1 Warenlager aktiv und Artikel ist auf Lager/im Zulauf/Ueberverkaeufe erlaubt/beachtet kein Lager *}
{if isset($Artikel->oWarenlager_arr) && $Artikel->oWarenlager_arr|@count > 1 && ($Artikel->cLagerBeachten !== 'Y' || $Artikel->cLagerKleinerNull === 'Y' || $Artikel->fLagerbestand > 0 || $Artikel->fZulauf > 0)}
    {if $tplscope === 'detail'}
        <a href="#" class="btn-store-availability" data-toggle="popover" data-placement="left" data-ref="#popover-warehouse"><i class="fa fa-map-marker" title="{lang key="availability" section="productDetails"}"></i></a>
    {/if}
    <div class="hidden" id="popover-warehouse">
        <table class="table warehouse-table">
        {assign var=anzeige value=$Einstellungen.artikeldetails.artikel_lagerbestandsanzeige}
        {foreach name=warenlager from=$Artikel->oWarenlager_arr item=oWarenlager}
            <tr>
                <td class="name"><strong>{$oWarenlager->cName}</strong></td>
                <td class="delivery-status">
                {if $anzeige !== 'nichts' && $Artikel->cLagerBeachten === 'Y' && ($Artikel->cLagerKleinerNull === 'N' || $Einstellungen.artikeldetails.artikeldetails_lieferantenbestand_anzeigen === 'U') && $oWarenlager->fBestand <= 0 && $oWarenlager->fZulauf > 0 && isset($oWarenlager->dZulaufDatum)}
                    {assign var=cZulauf value=$oWarenlager->fZulauf|cat:':::'|cat:$oWarenlager->dZulaufDatum_de}
                    <span class="signal_image status-1"><span>{lang key="productInflowing" section="productDetails" printf=$cZulauf}</span></span>
                {elseif $anzeige=='verfuegbarkeit'}
                    <span class="signal_image status-{$oWarenlager->oLageranzeige->nStatus}">{$oWarenlager->oLageranzeige->cLagerhinweis[$anzeige]}</span>
                {else}
                    <span><span class="signal_image status-{$oWarenlager->oLageranzeige->nStatus}">{$oWarenlager->oLageranzeige->AmpelText}</span></span>
                {/if}
                </td>
            </tr>
        {/foreach}
        </table>
    </div>
{/if}