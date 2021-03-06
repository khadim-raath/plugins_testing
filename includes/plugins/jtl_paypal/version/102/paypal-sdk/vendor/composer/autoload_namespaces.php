<?php

// autoload_namespaces.php @generated by Composer

$vendorDir = dirname(dirname(__FILE__));
$baseDir = dirname($vendorDir);

return array(
    'PayPal\\Types' => array($vendorDir . '/paypal/permissions-sdk-php/lib'),
    'PayPal\\Service' => array($vendorDir . '/paypal/merchant-sdk-php/lib', $vendorDir . '/paypal/permissions-sdk-php/lib'),
    'PayPal\\PayPalAPI' => array($vendorDir . '/paypal/merchant-sdk-php/lib'),
    'PayPal\\EnhancedDataTypes' => array($vendorDir . '/paypal/merchant-sdk-php/lib'),
    'PayPal\\EBLBaseComponents' => array($vendorDir . '/paypal/merchant-sdk-php/lib'),
    'PayPal\\CoreComponentTypes' => array($vendorDir . '/paypal/merchant-sdk-php/lib'),
    'PayPal' => array($vendorDir . '/paypal/rest-api-sdk-php/lib', $vendorDir . '/paypal/sdk-core-php/lib'),
);
