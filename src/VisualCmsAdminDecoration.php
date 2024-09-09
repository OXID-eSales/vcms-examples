<?php

/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

declare(strict_types=1);

namespace OxidEsales\VcmsExamples;

use OxidEsales\Eshop\Core\Controller\BaseController;
use OxidEsales\VisualCmsModule\Controller\Admin\VisualCmsAdmin;

class VisualCmsAdminDecoration extends BaseController
{
    public function __construct(
        protected VisualCmsAdmin $visualCmsAdmin
    ) {

    }

//    public function getClassKey()
//    {
//        return $this->visualCmsAdmin->getClassKey();
//    }
//
//    public function setClassKey($classKey)
//    {
//        return $this->visualCmsAdmin->setClassKey($classKey);
//    }
//
//    public function getFncName()
//    {
//        return $this->visualCmsAdmin->getFncName();
//    }
//
//    public function setFncName($sFncName)
//    {
//        return $this->visualCmsAdmin->setFncName($sFncName);
//    }
//
//    public function setViewParameters($aParams = null)
//    {
//        return $this->visualCmsAdmin->setViewParameters($aParams);
//    }
//
//    public function init()
//    {
//        return $this->visualCmsAdmin->init();
//    }
//
//    public function getViewId()
//    {
//        return $this->visualCmsAdmin->getViewId();
//    }
//
//    public function executeFunction($sFunction)
//    {
//        return $this->visualCmsAdmin->executeFunction($sFunction);
//    }
//
//    public function getIsCallForCache()
//    {
//        return $this->visualCmsAdmin->getIsCallForCache();
//    }
//
//    public function render()
//    {
//        return $this->visualCmsAdmin->render();
//    }
//
//    public function getViewData()
//    {
//        return $this->visualCmsAdmin->getViewData();
//    }
//
//    public function setViewData($aViewData = null)
//    {
//        return $this->visualCmsAdmin->setViewData($aViewData);
//    }
}