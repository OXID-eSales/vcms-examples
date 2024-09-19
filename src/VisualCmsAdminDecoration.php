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
        protected VisualCmsAdminInterface $visualCmsAdmin
    ) {
        parent::__construct($visualCmsAdmin);

        echo $this->siegHello();
    }

    public function siegHello(): string
    {
        return $this->visualCmsAdmin->siegHello() . ' extended';
    }
}