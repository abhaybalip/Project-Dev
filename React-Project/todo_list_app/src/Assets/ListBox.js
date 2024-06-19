import React from "react";
import './Styles/ListItem_style.css';
// import ListItem from "./ListItem";
import './Styles/ListBox_style.css';
import './Styles/ListItem_style.css';

export default class ListBox extends React.Component {
    constructor() {
        super()
        this.state = {
            count: 0,
            myList: []
        }
    }

    reset = ()=>{
        this.setState({
            count: 0,
            myList: []
        })
    }
    add_item = () => {
        var ip = document.getElementsByClassName('menu-text')
        var new_title = ip[0].value
        if (new_title != null || new_title != '') {
            var new_id = this.state.count + 1
            var new_list = [...this.state.myList, { id: new_id, title: new_title }]
            this.setState({
                count: new_id,
                myList: new_list
            })
            ip[0].value = ''
            console.log('item added : ' + new_title)
        } else {
            window.alert('Invalid task name !')
        }
    }

    remove_item = (id) => {
        console.log('item removed')
        var new_list = this.state.myList.filter(item => item.id !== id);
        this.setState({
            count: this.state.count - 1,
            myList: new_list
        });
    }

    list_item = (id, title) => {
        return (
            <div className="list-item">
                <div className="item-title">{id}. {title}</div>
                <button className="item-menu" onClick={() => this.remove_item(id)}><label>X</label></button>
            </div>
        );
    }

    render() {
        return (
            <>
                <div className="list-box">
                    <div className="list-title">Task - List </div>
                    <div className="box-menu">
                        <input className="menu-text" type="text" placeholder="Enter Task"></input>
                        <button className="menu-submit" onClick={this.add_item}>Submit</button>
                    </div>
                    <div className="list">
                        {this.state.myList.map(item => (
                            this.list_item(item.id, item.title)
                        ))}
                    </div>
                    <div className="list-reset" onClick={this.reset}><label>Reset</label></div>
                </div>
            </>
        )
    }
}