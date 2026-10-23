/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

import {container} from 'tsyringe';

/**
 * Example of decorating the VisualCMS widget modal.
 */
container.afterResolution(Symbol.for('oevcms.widget.WidgetModalInterface'), (token, modal) => {
    const open = modal.open.bind(modal);

    modal.open = (callback) => {
        console.log('VCMS examples: widget modal is opened');

        open((widget) => {
            console.log(`VCMS examples: widget "${widget.widget}" is saved`, widget);

            callback(widget);
        });
    };
}, {frequency: 'Once'});
