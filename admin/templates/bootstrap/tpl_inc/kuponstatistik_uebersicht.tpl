{include file='tpl_inc/seite_header.tpl' cTitel='Kupon Statistik'}
<div id="content">
    <form method="post" action="kuponstatistik.php" class="form-horizontal">
        {$jtl_token}
        <div class="input-group">
            <input type="hidden" name="formFilter" value="1" class="form-control"/>
            <div class="input-group-addon">
                <label for="SelectFromDay">von Datum:</label>
            </div>
            <div class="input-group-btn">
                <select name="cFromDay" class="combo form-control" id="SelectFromDay">
                    {section name=fromDay loop=32 start=1 step=1}
                        <option value="{$smarty.section.fromDay.index}"{if $cFromDate_arr.nTag == $smarty.section.fromDay.index} selected{/if}>{$smarty.section.fromDay.index}</option>
                    {/section}
                </select>
            </div>
            <div class="input-group-btn">
                <select name="cFromMonth" class="combo form-control">
                    <option value="1"{if $cFromDate_arr.nMonat == 1} selected{/if}>Januar</option>
                    <option value="2"{if $cFromDate_arr.nMonat == 2} selected{/if}>Februar</option>
                    <option value="3"{if $cFromDate_arr.nMonat == 3} selected{/if}>M&auml;rz</option>
                    <option value="4"{if $cFromDate_arr.nMonat == 4} selected{/if}>April</option>
                    <option value="5"{if $cFromDate_arr.nMonat == 5} selected{/if}>Mai</option>
                    <option value="6"{if $cFromDate_arr.nMonat == 6} selected{/if}>Juni</option>
                    <option value="7"{if $cFromDate_arr.nMonat == 7} selected{/if}>Juli</option>
                    <option value="8"{if $cFromDate_arr.nMonat == 8} selected{/if}>August</option>
                    <option value="9"{if $cFromDate_arr.nMonat == 9} selected{/if}>September</option>
                    <option value="10"{if $cFromDate_arr.nMonat == 10} selected{/if}>Oktober</option>
                    <option value="11"{if $cFromDate_arr.nMonat == 11} selected{/if}>November</option>
                    <option value="12"{if $cFromDate_arr.nMonat == 12} selected{/if}>Dezember</option>
                </select>
            </div>
            <div class="input-group-btn">
                <select name="cFromYear" class="combo form-control" >
                    {assign var=cJahr value=$smarty.now|date_format:"%Y"}
                    {section name=fromYear loop=$cJahr+1 start=2011 step=1}
                        <option value="{$smarty.section.fromYear.index}"{if $cFromDate_arr.nJahr == 1} selected{/if}>{$smarty.section.fromYear.index}</option>
                    {/section}
                </select>
            </div>
            <div class="input-group-addon">
                <label for="SelectToDay">bis Datum:</label>
            </div>
            <div class="input-group-btn">
                <select name="cToDay" class="combo form-control" id="SelectToDay">
                    {section name=toDay loop=32 start=1 step=1}
                        <option value="{$smarty.section.toDay.index}"{if $cToDate_arr.nTag == $smarty.section.toDay.index} selected{/if}>{$smarty.section.toDay.index}</option>
                    {/section}
                </select>
            </div>
            <div class="input-group-btn">
                <select name="cToMonth" class="combo form-control">
                    <option value="1"{if $cToDate_arr.nMonat == 1} selected{/if}>Januar</option>
                    <option value="2"{if $cToDate_arr.nMonat == 2} selected{/if}>Februar</option>
                    <option value="3"{if $cToDate_arr.nMonat == 3} selected{/if}>M&auml;rz</option>
                    <option value="4"{if $cToDate_arr.nMonat == 4} selected{/if}>April</option>
                    <option value="5"{if $cToDate_arr.nMonat == 5} selected{/if}>Mai</option>
                    <option value="6"{if $cToDate_arr.nMonat == 6} selected{/if}>Juni</option>
                    <option value="7"{if $cToDate_arr.nMonat == 7} selected{/if}>Juli</option>
                    <option value="8"{if $cToDate_arr.nMonat == 8} selected{/if}>August</option>
                    <option value="9"{if $cToDate_arr.nMonat == 9} selected{/if}>September</option>
                    <option value="10"{if $cToDate_arr.nMonat == 10} selected{/if}>Oktober</option>
                    <option value="11"{if $cToDate_arr.nMonat == 11} selected{/if}>November</option>
                    <option value="12"{if $cToDate_arr.nMonat == 12} selected{/if}>Dezember</option>
                </select>
            </div>
            <div class="input-group-btn">
                <select name="cToYear" class="combo form-control">
                    {assign var=cJahr value=$smarty.now|date_format:"%Y"}
                    {section name=toYear loop=$cJahr+1 start=2011 step=1}
                        <option value="{$smarty.section.toYear.index}"{if isset($cToDate_arr.nYear) && $cToDate_arr.nYear == 1} selected{/if}>{$smarty.section.toYear.index}</option>
                    {/section}
                </select>
            </div>
            <div class="input-group-addon">
                <label for="kKupon">Kupon:</label>
            </div>
            <div class="input-group-btn">
                <select id="kKupon" name="kKupon" class="combo form-control">
                    <option value="-1">Alle</option>
                    {foreach from=$Kupons_arr item=Kupon_arr}
                        <option value="{$Kupon_arr.kKupon}"{if isset($Kupon_arr.aktiv) && $Kupon_arr.aktiv} selected{/if}>{$Kupon_arr.cName}</option>
                    {/foreach}
                </select>
            </div>
            <div class="input-group-btn">
                <button name="btnSubmit" type="submit" value="Filtern" class="btn btn-primary">Filtern</button>
            </div>
        </div>
    </form>

    <div class="block">
        <table class="table">
            <tr>
                <td>Summe benutzter Kupons (% der Bestellungen):</td>
                <td><strong>{$zusammenfassung_arr.nCountUsedKupons} ({$zusammenfassung_arr.nProzentCountUsedKupons}%)</strong></td>
            </tr>
            <tr>
                <td>Bestellungen gesamt:</td>
                <td><strong>{$zusammenfassung_arr.nCountBestellungen}</strong></td>
            </tr>
            <tr>
                <td>Anzahl Kunden:</td>
                <td><strong>{$zusammenfassung_arr.nCountUser}</strong></td>
            </tr>
            <tr>
                <td>Wert aller benutzten Kupons zusammen:</td>
                <td><strong>{$zusammenfassung_arr.nSummeKuponAlle}</strong></td>
            </tr>
            <tr>
                <td>Wert aller Bestellungen mit benutzten Kupons:</td>
                <td><strong>{$zusammenfassung_arr.nSummeWarenkorbAlle}</strong></td>
            </tr>
        </table>
    </div>
    {if $usedKupons|@count > 0}
    <table class="table">
        <tr>
            <th>Kupon Name</th>
            <th>Kunde Name</th>
            <th>Bestell Nr.</th>
            <th>Kupon Wert</th>
            <th>Bestellung Wert</th>
            <th>Datum</th>
        </tr>
        {foreach from=$usedKupons item=usedKupon}
            <tr class="kuponLine">
                <td class="TD1 tcenter">
                    {if $usedKupon.kKupon}
                        <a href="kupons.php?&kKupon={$usedKupon.kKupon}&token={$smarty.session.jtl_token}">{$usedKupon.cName}</a>
                    {else}
                        {$usedKupon.cName}
                    {/if}
                </td>
                <td class="TD2 tcenter">{$usedKupon.cUserName}</td>
                <td class="TD3 tcenter">{$usedKupon.cBestellNr}</td>
                <td class="TD4 tcenter">{$usedKupon.nWertKupon}</td>
                <td class="TD5 tcenter">{$usedKupon.nSummeWarenkorb}</td>
                <td class="TD6 tcenter">{$usedKupon.dErstellt|date_format:"%d.%m.%Y %H:%M:%S"}</td>
            </tr>
            <tr id="bestellung_{$usedKupon.cBestellNr}" class="hidden">
                <td>&nbsp;</td>
                <td colspan="5" class="tcenter">
                    <table  class="table">
                        <tr>
                            <th>Bestellung Position</th>
                            <th>St&uuml;ckpreis Netto</th>
                            <th>Gesamtpreis Netto</th>
                            <th>Anzahl</th>
                        </tr>
                        {foreach from=$usedKupon.cBestellPos_arr item=cBestellPos_arr}
                            <tr>
                                <td>{$cBestellPos_arr.cName}</td>
                                <td>{$cBestellPos_arr.nPreisNetto}</td>
                                <td>{$cBestellPos_arr.nGesamtPreisNetto}</td>
                                <td>{$cBestellPos_arr.nAnzahl}</td>
                            </tr>
                        {/foreach}
                    </table>
                </td>
            </tr>
        {/foreach}
    </table>
    {else}
        <div class="alert alert-info" role="alert">{#noDataAvailable#}</div>
    {/if}
</div>
<script>
    {literal}
    $(document).ready(function () {
        $('.kuponLine').click(function () {
            var cBestellNr = this.getElementsByTagName('td')[2].innerHTML,
                elem = $('#bestellung_' + cBestellNr);
            if (elem.css('display') == 'none') {
                elem.show();
                elem.children().css('padding', '8px');
                elem.children().css('background-color', '#DDDDDD');
                $(this).children().css('background-color', '#DDDDDD');
            } else {
                elem.hide();
                elem.children().css('background-color', '#F9F9F9');
                $(this).children().css('background-color', '#F9F9F9');
            }
        });
    });
    {/literal}
</script>