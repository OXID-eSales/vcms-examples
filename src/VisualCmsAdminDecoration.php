<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

declare(strict_types=1);

namespace OxidEsales\VcmsExamples;

use OxidEsales\EshopCommunity\Internal\Framework\Controller\AbstractControllerDecorator;
use OxidEsales\VisualCmsModule\Controller\Admin\VisualCmsAdminInterface;

class VisualCmsAdminDecoration extends AbstractControllerDecorator
{
    public function __construct(
        VisualCmsAdminInterface $controller
    ) {
        parent::__construct($controller);

//        $this->siegHello();
    }

    public function siegHello(): string
    {
        die('in owerwrite');

        return $this->controller->siegHello() . ' extended';
    }

    public function render()
    {
        return $this->controller->render();
    }
}