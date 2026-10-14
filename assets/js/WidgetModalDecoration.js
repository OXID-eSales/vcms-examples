/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

/**
 * Example of decorating the VisualCMS widget modal.
 */
document.addEventListener('vcms:configure', ({detail: {container, tokens}}) => {
    container.afterResolution(tokens.WidgetModalInterface, (token, modal) => {
        const open = modal.open.bind(modal);

        modal.open = (callback) => {
            console.log('VCMS examples: widget modal is opened');

            open((widget) => {
                console.log(`VCMS examples: widget "${widget.widget}" is saved`, widget);

                callback(widget);
            });
        };
    }, {frequency: 'Once'});
});
