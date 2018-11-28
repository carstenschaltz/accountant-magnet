import "bootstrap";
import { showForm } from './editEnquiry.js'
import { fillSummary } from './fillSummary.js'
import { toggleActive } from './toggleActive.js'
import { location } from './location.js'
import { next, back, skip } from './toggleEnquiryTabs.js'
import { getInTouch } from './getInTouch.js'
// import './select2.js';

showForm();
fillSummary();
toggleActive();
location();
next();
back();
skip();
getInTouch();

