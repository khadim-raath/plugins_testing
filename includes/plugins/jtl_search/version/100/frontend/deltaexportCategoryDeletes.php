<?php
try {
    if (isset($args_arr['kKategorie']) && $args_arr['kKategorie'] > 0) {
        $oObj = new stdClass();
        $oObj->kId = $args_arr['kKategorie'];
        $oObj->eDocumentType = 'category';
        $oObj->bDelete = 1;
        $oObj->dLastModified = 'now()';

        if ($GLOBALS['DB']->insertRow('tjtlsearchdeltaexport', $oObj) == 0) {
            $GLOBALS['DB']->executeQuery('UPDATE tjtlsearchdeltaexport SET bDelete = 1, dLastModified = now() WHERE kId = '.$oObj->kId.' AND eDocumentType = "'.$oObj->eDocumentType.'";', 10);
        }
    }
} catch (Exception $oEx) {
    error_log("Error: \n".print_r($oEx, true), 3, PFAD_ROOT.'jtllogs/dbes.txt');
}
