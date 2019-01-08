'use strict';

class Generator {
    constructor() {
        this.rarityItemSelector = '.rarity_item';

        this.buttonCheckAll = document.getElementById('check_all_types_button');
        this.buttonUncheckAll = document.getElementById('uncheck_all_types_button');
        this.typeCheckboxes = document.querySelectorAll('.type_checkbox_input');
        this.rarityItems = document.querySelectorAll(this.rarityItemSelector);
        this.addEvents();
    }

    addEvents() {
        this.buttonCheckAll.addEventListener('click', this.checkAllTypesEvent.bind(this));
        this.buttonUncheckAll.addEventListener('click', this.uncheckAllTypesEvent.bind(this));

        this.rarityItems.forEach(this.addSelectRarityEvent.bind(this));
    }
    addSelectRarityEvent(item) {
        item.addEventListener('click', this.selectRarityEvent.bind(this));
    }

    /** Events **/

    checkAllTypesEvent(event) {
        this.typeCheckboxes.forEach(
            function(element) {
                element.setAttribute("checked", "checked");
                element.checked = true;
            }
        );
        event.preventDefault();
    }
    uncheckAllTypesEvent(event) {
        this.typeCheckboxes.forEach(
            function(element) {
                element.removeAttribute("checked");
                element.checked = false;
            }
        );
        event.preventDefault();
    }
    selectRarityEvent(event){
        let obj = event.currentTarget;
        let parent = obj.parentNode;

        let selected = (obj.dataset.selected === 'true');
        obj.dataset.selected = (!selected).toString();

        if (!selected) {
            parent.querySelectorAll(this.rarityItemSelector).forEach(function (item) {
                if (item !== obj) {
                    item.style.display = 'none';
                }
            });
        }
        else {
            parent.querySelectorAll(this.rarityItemSelector).forEach(function (item) {
                if (item !== obj) {
                    item.style.display = 'inline-block';
                }
            });
        }
        event.preventDefault();
    }
}

let generator = new Generator();