import React from "react";
import './Styles/MainPage_style.css';
import ListBox from './ListBox';

export default class MainPage extends React.Component{
    constructor(){
        super()
    }
    render(){
        return(
            <>
            <div className="main-page">
                <div className="page-title">To-Do List App</div>
                <div className="page-context">
                    <ListBox></ListBox>
                </div>
                <div className="page-about"></div>
            </div>
            </>
        )
    }
}