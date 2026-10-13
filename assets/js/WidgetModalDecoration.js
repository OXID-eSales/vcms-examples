/**
 * Copyright © OXID eSales AG. All rights reserved.
 * See LICENSE file for license details.
 */

/**
 * Example of decorating the VisualCMS widget modal.
 */
document.addEventListener('vcms:configure', ({detail: {decorate, createDecorator, tokens}}) => {
    decorate(tokens.WidgetModalInterface, (inner) => createDecorator(inner, {
        open(callback) {
            console.log('VCMS examples: widget modal is opened');

            inner.open((widget) => {
                console.log(`VCMS examples: widget "${widget.widget}" is saved`, widget);

                callback(widget);
            });
        },
    }), 10);
});
