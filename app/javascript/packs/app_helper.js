export function  screenshareMode(session, mode){
    if(mode == 'on'){
        window.location = '/screenshare?name=' + name;
        session.signal({
            type: 'screenshare',
            data: 'on'
        });
    }
    else if(mod == 'off'){
        window.location='/videochat?name='+name;
        session.signal({
            type: 'screenshare',
            data: 'off'
        });
    };
};

export function setButtonDisplay(element){
    element.style.display="block";
};
export function formatChatMsg(message) {
    return  `${name}: ${message}`
};

export function streamLayout(element, count){
    if(count>=6){
        element.classList.add("grid9");
    }else if (count == 5) {
        element.classList.remove("grid9");
        element.classList.add("grid4");
    } else if (count < 5) {
        element.classList.remove("grid4");
    }
};