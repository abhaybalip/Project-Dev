import React from "react";
import './Styles/ListItem_style.css';

export default class ListItem extends React.Component {
    constructor({ id, title }) {
        super();
        this.id = id;
        this.title = title;
    }
    render() {
        return (
            <>
                <div className="list-item">
                    <div className="item-title">{this.id}. {this.title}</div>
                    <button className="item-menu" onClick={this.remove} ><label>X</label></button>
                </div>
            </>
        )
    }
}